<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, usePage } from "@inertiajs/vue3";
import { ref, onMounted, onBeforeMount, watch, computed } from "vue";
import { useAppStore } from "@/stores/aplicacion/appStore";
import { useAxios } from "@/composables/axios/useAxios";
import axios from "axios";
import { usePedidos } from "@/composables/pedidos/usePedidos";
import UbicacionCliente from "./UbicacionCliente.vue";
const { setPedido, limpiarPedido, form } = usePedidos();

// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
const { props: props_page } = usePage();
const appStore = useAppStore();
const { axiosDelete } = useAxios();

onBeforeMount(() => {
    appStore.startLoading();
});

const listClientes = ref([]);
const cliente_id = ref(null);
const cargarClientes = () => {
    axios
        .get(route("clientes.listadoSegmentacion"))
        .then((response) => {
            listClientes.value = response.data.clientes;
        })
        .finally(() => {});
};

const listPedidos = ref([]);
const pedido_id = ref(null);
const oCliente = ref(null);
const muestra_formulario = ref(false);
const cargarPedidosCliente = () => {
    listPedidos.value = [];
    pedido_id.value = null;
    axios
        .get(route("pedidos.listadoByCliente"), {
            params: {
                cliente_id: cliente_id.value,
            },
        })
        .then((response) => {
            listPedidos.value = response.data.pedidos;
            oCliente.value = listClientes.value.find(
                (c) => c.id == cliente_id.value,
            );
        })
        .finally(() => {});
};

const verUbicacionCliente = () => {
    console.log(oCliente.value);
    muestra_formulario.value = true;
};
const cargarPedido = () => {
    limpiarPedido();
    axios
        .get(route("pedidos.show", pedido_id.value))
        .then((response) => {
            setPedido(response.data);
        })
        .finally(() => {});
};

const listTipoPagos = ref([
    {
        value: "EFECTIVO",
        label: "EFECTIVO",
    },
    {
        value: "QR",
        label: "QR",
    },
    {
        value: "MIXTO",
        label: "MIXTO",
    },
]);

const enviando = ref(false);
const resetearFormulario = () => {
    cliente_id.value = null;
    pedido_id.value = null;
    listPedidos.value = [];
    limpiarPedido();
};
const enviarFormulario = () => {
    enviando.value = true;
    let url = route("pedidos.distribucion_pedido", form.id);
    form.post(url, {
        preserveScroll: true,
        forceFormData: true,
        onSuccess: (response) => {
            console.log("correcto");
            const success =
                response.props.flash.success ?? "Proceso realizado con éxito";
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>${success}</strong>`,
                confirmButtonText: `Aceptar`,
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });
            if (response.props.flash.url_pedido_pdf) {
                window.open(response.props.flash.url_pedido_pdf, "_blank");
            }
            resetearFormulario();
        },
        onError: (err, code) => {
            console.log(code ?? "");
            console.log(form.errors);
            if (form.errors) {
                const error =
                    "Existen errores en el formulario, por favor verifique";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            } else {
                const error =
                    "Ocurrió un error inesperado contactese con el Administrador";
                Swal.fire({
                    icon: "info",
                    title: "Error",
                    html: `<strong>${error}</strong>`,
                    confirmButtonText: `Aceptar`,
                    customClass: {
                        confirmButton: "btn-error",
                    },
                });
            }
            console.log("error: " + err.error);
        },
        onFinish: () => {
            enviando.value = false;
        },
    });
};

// CARRITO
const modificaCantidadEntrega = (e, index) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);
    if (!value || value == 0) {
        return;
    }

    // validar que no sea mayor a la cantidad despacho
    let cantidad_limite = form.pedido_detalles[index].cantidad_despacho;
    if (value > parseFloat(cantidad_limite)) {
        const error = `La cantidad no puede ser mayor a ${cantidad_limite}`;
        form.pedido_detalles[index].cantidad_entregado = cantidad_limite;
        Swal.fire({
            icon: "info",
            title: "Error",
            html: `<strong>${error}</strong>`,
            confirmButtonText: `Aceptar`,
            customClass: {
                confirmButton: "btn-error",
            },
        });
        return;
    }
    form.pedido_detalles[index].cantidad_entrega = value;
    form.pedido_detalles[index].cantidad =
        parseFloat(value) /
        parseFloat(form.pedido_detalles[index].presentacion_producto.equivale);
    form.pedido_detalles[index].cantidad = parseFloat(
        form.pedido_detalles[index].cantidad,
    ).toFixed(2);
    form.pedido_detalles[index].subtotal =
        parseFloat(form.pedido_detalles[index].cantidad) *
        parseFloat(form.pedido_detalles[index].presentacion_producto.precio);

    form.pedido_detalles[index].subtotal = parseFloat(
        form.pedido_detalles[index].subtotal,
    ).toFixed(2);
};

const modificaCantidad = (e, index) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);
    if (!value || value == 0) {
        return;
    }

    // validar que no sea mayor a la cantidad despacho
    let cantidad_limite =
        parseFloat(form.pedido_detalles[index].cantidad_despacho) /
        parseFloat(form.pedido_detalles[index].presentacion_producto.equivale);
    cantidad_limite = parseFloat(cantidad_limite).toFixed(2);

    if (value > parseFloat(cantidad_limite)) {
        const error = `La cantidad no puede ser mayor a ${cantidad_limite}`;
        form.pedido_detalles[index].cantidad = cantidad_limite;
        Swal.fire({
            icon: "info",
            title: "Error",
            html: `<strong>${error}</strong>`,
            confirmButtonText: `Aceptar`,
            customClass: {
                confirmButton: "btn-error",
            },
        });
        return;
    }

    form.pedido_detalles[index].cantidad = value;
    form.pedido_detalles[index].cantidad_total =
        parseFloat(value) *
        parseFloat(form.pedido_detalles[index].presentacion_producto.equivale);
    form.pedido_detalles[index].subtotal =
        parseFloat(value) *
        parseFloat(form.pedido_detalles[index].presentacion_producto.precio);

    form.pedido_detalles[index].subtotal = parseFloat(
        form.pedido_detalles[index].subtotal,
    ).toFixed(2);
};

const subtotalPedido = computed(() => {
    return form.pedido_detalles.reduce((total, elem) => {
        return (total += parseFloat(elem.subtotal));
    }, 0);
});
const totalPedido = computed(() => {
    let total = parseFloat(subtotalPedido.value);

    if (form.descuento) {
        total = parseFloat(subtotalPedido.value) - parseFloat(form.descuento);
    }
    return total;
});

const eliminarFila = (item, index) => {
    console.log(item, index);
    if (item.id && item.id != 0) {
        form.eliminados.push(item.id);
    }
    form.pedido_detalles.splice(index, 1);
};

watch([subtotalPedido, totalPedido], () => {
    form.subtotal = subtotalPedido.value.toFixed(2);
    form.total = totalPedido.value.toFixed(2);
});

onMounted(async () => {
    limpiarPedido();
    cargarClientes();
    appStore.stopLoading();
});
</script>
<template>
    <Head title="Distribución de Pedidos"></Head>

    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-truck"></i> Distribución de Pedidos
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">
                            Distribución de Pedidos
                        </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>

        <div class="row">
            <div class="col-md-6">
                <label class="">Seleccionar Cliente</label>
                <el-select
                    v-model="cliente_id"
                    no-data-text="Sin datos"
                    no-match-text="Sin resultados"
                    placeholder="- Seleccione -"
                    filterable
                    @change="cargarPedidosCliente()"
                    clearable
                >
                    <el-option
                        v-for="item in listClientes"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>

                <button
                    class="btn btn-outline-primary mt-2 btn-sm"
                    @click="verUbicacionCliente"
                    v-if="cliente_id"
                >
                    <i class="fa fa-map-marker-alt"></i> Ver ubicación
                </button>
                <UbicacionCliente
                    v-if="muestra_formulario"
                    :muestra_formulario="muestra_formulario"
                    :cliente="oCliente"
                    @cerrar-formulario="muestra_formulario = false"
                ></UbicacionCliente>
            </div>
            <div class="col-md-6">
                <label class=""
                    >Código de Pedido
                    <span v-if="cliente_id" class="text-muted text-sm"
                        >({{ listPedidos.length }} Pendientes)</span
                    ></label
                >
                <el-select
                    v-model="pedido_id"
                    no-data-text="Sin datos"
                    no-match-text="Sin resultados"
                    placeholder="- Seleccione -"
                    filterable
                    @change="cargarPedido"
                    clearable
                >
                    <el-option
                        v-for="item in listPedidos"
                        :key="item.id"
                        :value="item.id"
                        :label="item.id"
                    ></el-option>
                </el-select>
            </div>
        </div>
        <div class="row mt-3" v-if="form && form.id != 0">
            <div class="col-12">
                <div class="card">
                    <div class="card-body pt-1">
                        <div class="row fila_carrito pb-2">
                            <div class="col-12">
                                <h4 class="h5">
                                    Código de Pedido: {{ form.id }}
                                </h4>
                                <div
                                    class="row border-top mb-2"
                                    v-for="(
                                        item, index
                                    ) in form.pedido_detalles"
                                >
                                    <div class="col-12 fw-bold fs-5">
                                        <i class="fa fa-caret-right"></i>
                                        {{ item.producto.nombre }}
                                        <button
                                            type="button"
                                            @click.prevent="
                                                eliminarFila(item, index)
                                            "
                                            class="btn btn-sm btn-danger float-end px-2 pt-0 pb-0"
                                        >
                                            <i class="fa fa-trash text-xs"></i>
                                        </button>
                                    </div>
                                    <div class="col-3">
                                        <div class="fw-bold text-center">
                                            {{
                                                item.presentacion_producto
                                                    .nombre
                                            }}
                                        </div>
                                        <div class="text-center text-md">
                                            <input
                                                type="number"
                                                step="1"
                                                class="form-control text-center"
                                                v-model="item.cantidad"
                                                @keyup="
                                                    modificaCantidad(
                                                        $event,
                                                        index,
                                                    )
                                                "
                                                @change="
                                                    modificaCantidadEntrega(
                                                        $event,
                                                        index,
                                                    )
                                                "
                                            />
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="fw-bold text-center">
                                            Unids.
                                        </div>
                                        <div class="text-center text-md">
                                            <input
                                                type="number"
                                                step="1"
                                                min="1"
                                                class="form-control text-center"
                                                v-model="
                                                    item.cantidad_entregado
                                                "
                                                @keyup="
                                                    modificaCantidadEntrega(
                                                        $event,
                                                        index,
                                                    )
                                                "
                                                @change="
                                                    modificaCantidadEntrega(
                                                        $event,
                                                        index,
                                                    )
                                                "
                                            />
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="fw-bold text-center">
                                            {{
                                                item.presentacion_producto
                                                    .nombre
                                            }}
                                            Bs.
                                        </div>
                                        <div class="text-center text-md">
                                            {{ item.precio }}
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="fw-bold text-center">
                                            Subtotal Bs.
                                        </div>
                                        <div class="text-center text-md">
                                            {{ item.subtotal }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row border-top pt-3 fila_total">
                            <div
                                class="col-6 border rounded pb-0 mb-0 d-flex align-items-center"
                            >
                                <b>Subtotal Bs.</b> {{ subtotalPedido }}
                            </div>
                            <div class="col-6 border rounded pb-0 mb-0">
                                <span class="label fw-bold">Descuento Bs.</span>
                                <input
                                    type="number"
                                    step="0.01"
                                    class="form-control"
                                    v-model="form.descuento"
                                />
                            </div>
                            <div class="col-12 border rounded mt-2 pt-2 pb-2">
                                <b>Total Bs.</b> {{ totalPedido }}
                            </div>
                        </div>

                        <div class="row mt-2">
                            <div class="col-12 mb-2">
                                <label class="required">Tipo de Pago</label>
                                <el-select
                                    v-model="form.tipo_pago"
                                    placeholder="Seleccionar tipo de pago"
                                >
                                    <el-option
                                        v-for="tipo in listTipoPagos"
                                        :key="tipo.value"
                                        :value="tipo.value"
                                        :label="tipo.label"
                                    />
                                </el-select>
                                <ul
                                    v-if="form.errors?.tipo_pago"
                                    class="list-unstyled text-danger"
                                >
                                    <li class="parsley-required">
                                        {{ form.errors?.tipo_pago }}
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6 offset-md-3">
                                <button
                                    class="btn btn-primary w-100"
                                    @click="enviarFormulario"
                                    :disabled="enviando"
                                >
                                    Registrar Distribución
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </Content>
</template>
<style scoped>
.fila_carrito {
    background-color: rgb(245, 245, 245);
}
.fila_total {
    background-color: rgb(249, 252, 236);
}
</style>

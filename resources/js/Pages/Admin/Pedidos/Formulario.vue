<script setup>
import { useForm, usePage } from "@inertiajs/vue3";
import { watch, ref, computed, defineEmits, onMounted, nextTick } from "vue";
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
const props = defineProps({
    form: {
        type: Object,
    },
});

const enviando = ref(false);
const form = props.form;

const textBtn = computed(() => {
    if (enviando.value) {
        return `<i class="fa fa-spin fa-spinner"></i> Enviando...`;
    }
    if (form.id == 0) {
        return `<i class="fa fa-save"></i> Finalizar Pedido`;
    }
    return `<i class="fa fa-edit"></i> Actualizar Pedido`;
});

const enviarFormulario = () => {
    enviando.value = true;
    let url =
        form["_method"] == "POST"
            ? route("pedidos.store")
            : route("pedidos.update", form.id);

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

            emits("envio-formulario");
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

const emits = defineEmits(["envio-formulario"]);

const listClientes = ref([]);
const cargarClientes = () => {
    axios
        .get(route("clientes.listadoSegmentacion"))
        .then((response) => {
            listClientes.value = response.data.clientes;
        })
        .finally(() => {});
};

const listProductos = ref([]);
const cargarProductos = () => {
    axios.get(route("productos.listado")).then((response) => {
        listProductos.value = response.data.productos;
    });
};

const cargarListas = () => {
    cargarClientes();
    cargarProductos();
};

const producto_id = ref(null);
const listPresentacionProducto = ref([]);
const productoSeleccionado = ref(null);
const presentacionSeleccionado = ref(null);
const cantidad = ref(1);
const cantidad_total = computed(() => {
    return (
        (cantidad.value && cantidad.value > 0 ? cantidad.value : 0) *
        presentacionSeleccionado.value.equivale
    );
});
const subtotal = computed(() => {
    return (
        (cantidad.value && cantidad.value > 0 ? cantidad.value : 0) *
        presentacionSeleccionado.value.precio
    );
});
const seleccionarProducto = (value) => {
    ((listPresentacionProducto.value = []),
        (presentacionSeleccionado.value = null));
    productoSeleccionado.value = listProductos.value.filter(
        (elem) => elem.id == value,
    )[0];
    if (!productoSeleccionado.value) {
        toast.error("Ocurrió un error al intentar cargar el producto");
    }

    listPresentacionProducto.value =
        productoSeleccionado.value.presentacion_productos;
};

const seleccionarPresentacion = (item) => {
    if (!item) {
        toast.error("Ocurrió un error al intentar cargar la presentación");
    }

    if (
        presentacionSeleccionado.value &&
        presentacionSeleccionado.value.id == item.id
    ) {
        presentacionSeleccionado.value = null;
        return;
    }
    presentacionSeleccionado.value = item;
};

const agregarCarrito = () => {
    if (!productoSeleccionado.value || !presentacionSeleccionado.value) {
        toast.error("Ocurrió un error al cargar al carrito");
        return;
    }

    if (!cantidad.value || parseFloat(cantidad.value) < 1) {
        toast.error("La cantidad igresada no es valida");
        return;
    }

    if (verificaExistencia(productoSeleccionado.value.id)) {
        toast.error("El producto ya esta en la lista");
        return;
    }

    form.pedido_detalles.push({
        id: 0,
        pedido_id: 0,
        producto_id: productoSeleccionado.value.id,
        producto: productoSeleccionado.value,
        presentacion_producto_id: presentacionSeleccionado.value.id,
        presentacion_producto: presentacionSeleccionado.value,
        cantidad: cantidad.value,
        cantidad_total: cantidad_total.value,
        cantidad_despacho: 0,
        cantidad_entregado: 0,
        cantidad_devolucion: 0,
        precio: presentacionSeleccionado.value.precio,
        subtotal: subtotal.value,
    });

    limpiarAgregar();
    toast.success("Registro agregado");
};
const modificaCantidad = (e, index) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);
    if (!value || value == 0) {
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

const verificaExistencia = (producto_id) => {
    const existe = form.pedido_detalles.filter(
        (elem) => elem.producto_id == producto_id,
    )[0];
    if (existe) {
        return true;
    }

    return false;
};

const limpiarAgregar = () => {
    productoSeleccionado.value = null;
    presentacionSeleccionado.value = null;
    listPresentacionProducto.value = [];
    cantidad.value = 1;
    producto_id.value = null;
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
onMounted(() => {
    cargarListas();
});
</script>

<template>
    <form @submit.prevent="enviarFormulario()" class="container-fluid">
        <div class="row">
            <div class="col-md-6 mt-2">
                <label class="required">Seleccionar Cliente</label>
                <el-select
                    v-model="form.cliente_id"
                    no-data-text="Sin datos"
                    no-match-text="Sin resultados"
                    placeholder="- Seleccione -"
                    filterable
                >
                    <el-option
                        v-for="item in listClientes"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>
                <ul
                    v-if="form.errors?.cliente_id"
                    class="list-unstyled text-danger"
                >
                    <li class="parsley-required">
                        {{ form.errors?.cliente_id }}
                    </li>
                </ul>
            </div>
            <div class="col-md-6 mt-2">
                <label class="">Observación</label>
                <el-input
                    type="textarea"
                    v-model="form.observacion"
                    autosize
                ></el-input>
                <ul
                    v-if="form.errors?.observacion"
                    class="list-unstyled text-danger"
                >
                    <li class="parsley-required">
                        {{ form.errors?.observacion }}
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt-2 border-top pt-2">
            <div class="col-12">
                <h4 class="h5">Producto</h4>
                <el-select
                    v-model="producto_id"
                    no-data-text="Sin datos"
                    no-match-text="Sin resultados"
                    placeholder="- Seleccionar Producto -"
                    filterable
                    @change="seleccionarProducto"
                >
                    <el-option
                        v-for="item in listProductos"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>
            </div>
            <div class="col-12 mt-2" v-if="productoSeleccionado">
                <p class="mb-0 text-sm">Seleccionar presentación</p>
                <div class="row">
                    <div
                        v-for="item in listPresentacionProducto"
                        :key="`${item.id}${productoSeleccionado.id}`"
                        class="col-md-3 col-6 mt-1 itemPresentacion"
                        @click.prevent="seleccionarPresentacion(item)"
                    >
                        <div class="card">
                            <div
                                class="card-body p-1"
                                :class="{
                                    seleccionado:
                                        presentacionSeleccionado?.id == item.id,
                                }"
                            >
                                <div class="row">
                                    <div
                                        class="col-md-7 text-sm fw-bold text-center"
                                    >
                                        {{ item.nombre }}
                                    </div>
                                    <div class="col-md-5 text-sm text-center">
                                        {{ item.equivale }} unidad(es)
                                    </div>
                                    <div class="col-12 text-center">
                                        Bs. {{ item.precio }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div
                class="col-12 mt-2"
                v-if="productoSeleccionado && presentacionSeleccionado"
            >
                <label>Cantidad</label>
                <div class="input-group">
                    <input
                        type="number"
                        step="1"
                        min="1"
                        class="form-control text-center"
                        v-model="cantidad"
                    />
                    <div class="input-group-text">
                        {{ cantidad_total }} Unidad(es)
                        <span clas="fw-bold text-bg1">
                            = Bs. {{ subtotal }}</span
                        >
                    </div>
                </div>
            </div>
            <div class="col-md-6 offset-md-3 mt-2">
                <button
                    type="button"
                    @click.prevent="agregarCarrito"
                    class="btn btn-sm btn-outline-primary w-100"
                    :disabled="
                        !productoSeleccionado || !presentacionSeleccionado
                    "
                >
                    <i class="fa fa-plus"></i> Agregar
                </button>
            </div>
        </div>
        <div class="row mt-2 border-top pt-2 fila_carrito">
            <div class="col-12">
                <h4 class="h5">Carrito</h4>
                <div
                    class="row border-top mb-2"
                    v-for="(item, index) in form.pedido_detalles"
                >
                    <div class="col-12 fw-bold fs-5">
                        <i class="fa fa-caret-right"></i>
                        {{ item.producto.nombre }}
                        <button
                            type="button"
                            @click.prevent="eliminarFila(item, index)"
                            class="btn btn-sm btn-danger float-end px-2 pt-0 pb-0"
                        >
                            <i class="fa fa-trash text-xs"></i>
                        </button>
                    </div>
                    <div class="col-3">
                        <div class="fw-bold text-center">
                            {{ item.presentacion_producto.nombre }}
                        </div>
                        <div class="text-center text-md">
                            <input
                                type="number"
                                step="1"
                                class="form-control text-center"
                                v-model="item.cantidad"
                                @keyup="modificaCantidad($event, index)"
                                @change="modificaCantidad($event, index)"
                            />
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="fw-bold text-center">Unids.</div>
                        <div class="text-center text-md">
                            {{ item.cantidad_total }}
                        </div>
                    </div>
                    <div class="col-3">
                        <div class="fw-bold text-center">
                            {{ item.presentacion_producto.nombre }} Bs.
                        </div>
                        <div class="text-center text-md">{{ item.precio }}</div>
                    </div>
                    <div class="col-3">
                        <div class="fw-bold text-center">Subtotal Bs.</div>
                        <div class="text-center text-md">
                            {{ item.subtotal }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top pt-2 fila_total">
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
        <div class="row mt-3">
            <div class="col-md-6 offset-md-3">
                <button
                    class="btn btn-primary w-100"
                    v-html="textBtn"
                    :disabled="enviando"
                ></button>
            </div>
        </div>
    </form>
</template>
<style scoped>
.itemPresentacion {
    cursor: pointer;
}

.seleccionado {
    background-color: var(--bg2);
    color: white;
}

.fila_carrito {
    background-color: rgb(245, 245, 245);
}
.fila_total {
    background-color: rgb(249, 252, 236);
}
</style>

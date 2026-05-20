<script setup>
import Content from "@/Components/Content.vue";
import { Head, Link, usePage } from "@inertiajs/vue3";
import { ref, onMounted, onBeforeMount, watch } from "vue";
import { useAppStore } from "@/stores/aplicacion/appStore";
import { useAxios } from "@/composables/axios/useAxios";
import axios from "axios";
// TOAST
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";
const { props: props_page } = usePage();
const appStore = useAppStore();
const { axiosDelete } = useAxios();

onBeforeMount(() => {
    appStore.startLoading();
});

const listDistribuidors = ref([]);
const cargarDistribuidors = () => {
    axios
        .get(route("usuarios.listado"), {
            params: {
                tipo: "DISTRIBUIDOR",
            },
        })
        .then((response) => {
            listDistribuidors.value = response.data.usuarios;
        })
        .finally(() => {});
};

const distribuidor_id = ref(null);
const observacion = ref("");

const listCategoriaProductoPedidos = ref([]);
const cargarPedidosDistribuidor = () => {
    axios
        .get(route("pedidos.pedidos_distruibidor"), {
            params: {
                distribuidor_id: distribuidor_id.value,
            },
        })
        .then((response) => {
            listCategoriaProductoPedidos.value =
                response.data.categoria_productos;
        });
};

const modificaCantidadCliente = (
    e,
    fila_categoria,
    fila_producto,
    fila_detalle,
) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);

    listCategoriaProductoPedidos.value[fila_categoria]["productos"][
        fila_producto
    ]["pedido_detalles"][fila_detalle]["cantidad_total"] = value;
    recalculaCantidadDespacho(fila_categoria, fila_producto);
};

const recalculaCantidadDespacho = (fila_categoria, fila_producto) => {
    listCategoriaProductoPedidos.value[fila_categoria]["productos"][
        fila_producto
    ].cantidad_despacho = listCategoriaProductoPedidos.value[fila_categoria][
        "productos"
    ][fila_producto]["pedido_detalles"].reduce((total, detalle) => {
        return (total += parseFloat(detalle.cantidad_total));
    }, 0);

    listCategoriaProductoPedidos.value[fila_categoria]["productos"][
        fila_producto
    ].stock_previsto =
        parseFloat(
            listCategoriaProductoPedidos.value[fila_categoria]["productos"][
                fila_producto
            ].stock_actual,
        ) -
        parseFloat(
            listCategoriaProductoPedidos.value[fila_categoria]["productos"][
                fila_producto
            ].cantidad_despacho,
        );
};

const enviando = ref(false);
const errors = ref(null);
const enviarFormulario = () => {
    enviando.value = true;
    let url = route("despachos.store");

    axios
        .post(url, {
            distribuidor_id: distribuidor_id.value,
            observacion: observacion.value,
            listCategoriaProductoPedidos: listCategoriaProductoPedidos.value,
            _method: "post",
        })
        .then((response) => {
            console.log("correcto");
            const success = "Registro correcto";
            Swal.fire({
                icon: "success",
                title: "Correcto",
                html: `<strong>${success}</strong>`,
                confirmButtonText: `Aceptar`,
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });
            setTimeout(() => {
                window.location.href = route("despachos.index");
            }, 300);
        })
        .catch((error) => {
            if (error.response.status === 422) {
                errors.value = error.response.data.errors;
                const errores = error.response.data.errors;
                let listaErrores = "<ul style='text-align:left;'>";
                Object.entries(errores).forEach(([campo, mensajes]) => {
                    mensajes.forEach((msg) => {
                        listaErrores += `<li>${msg}</li>`;
                    });
                });
                listaErrores += "</ul>";

                Swal.fire({
                    icon: "error",
                    title: "Errores de validación",
                    html: listaErrores,
                    confirmButtonText: "Aceptar",
                    customClass: {
                        confirmButton: "btn-alert-success",
                    },
                });
                return;
            }

            Swal.fire({
                icon: "error",
                title: "Error",
                html: `<strong>Ocurrió un error</strong>`,
                confirmButtonText: "Aceptar",
                customClass: {
                    confirmButton: "btn-alert-success",
                },
            });
        })
        .finally(() => {
            enviando.value = false;
        });
};

onMounted(async () => {
    cargarDistribuidors();
    appStore.stopLoading();
});
</script>
<template>
    <Head title="Despachos"></Head>

    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-clipboard-list"></i> Despachos
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item">
                            <Link :href="route('despachos.index')"
                                >Despachos</Link
                            >
                        </li>
                        <li class="breadcrumb-item active">Nuevo</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>

        <div class="row mb-2">
            <div class="col-md-4">
                <Link
                    v-if="
                        props_page.auth?.user.permisos == '*' ||
                        props_page.auth?.user.permisos.includes(
                            'despachos.index',
                        )
                    "
                    type="button"
                    class="btn btn-light bg-white border text-sm"
                    :href="route('despachos.index')"
                >
                    <i class="fa fa-arrow-left"></i> Volver
                </Link>
            </div>
            <div class="col-md-8 my-1"></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label>Distribuidor</label>
                <el-select
                    v-model="distribuidor_id"
                    placeholder="- Seleccione Distribuidor -"
                    filterable
                    no-data-text="Sin datos"
                    no-match-text="Sin resultados"
                    @change="cargarPedidosDistribuidor"
                >
                    <el-option
                        v-for="item in listDistribuidors"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>
            </div>
            <div class="col-md-12">
                <label>Observación</label>
                <el-input type="textarea" v-model="observacion" autosize>
                </el-input>
            </div>
            <div class="col-12"></div>
            <div class="col-12 mt-2 overflow-auto">
                <table
                    class="table table-bordered bg-white"
                    style="min-width: 900px"
                >
                    <thead>
                        <tr>
                            <th class="bg-principal">Producto</th>
                            <th class="bg-principal" style="min-width: 140px">
                                Cantidad Pedido
                            </th>
                            <th class="bg-principal" style="min-width: 140px">
                                Stock Actual
                            </th>
                            <th class="bg-principal" style="min-width: 140px">
                                Cantidad Despacho
                            </th>
                            <th class="bg-principal" style="min-width: 140px">
                                Stock Previsto
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <template
                            v-if="listCategoriaProductoPedidos.length > 0"
                        >
                            <template
                                v-for="(
                                    item, fila_categoria
                                ) in listCategoriaProductoPedidos"
                                :key="item.id"
                            >
                                <td
                                    class="bg2t text-white fw-bold ps-2"
                                    colspan="5"
                                >
                                    {{ item.nombre }}
                                </td>
                                <template
                                    v-for="(
                                        producto_categoria, fila_producto
                                    ) in item.productos"
                                    :key="producto_categoria.id"
                                >
                                    <tr>
                                        <td>
                                            <span class="fw-bold fs-6 me-1">
                                                {{
                                                    producto_categoria.nombre
                                                }}</span
                                            >
                                            <button
                                                class="btn btn-primary btn-sm text-xs px-1 pt-0 pb-0"
                                                @click="
                                                    producto_categoria.ver =
                                                        !producto_categoria.ver
                                                "
                                            >
                                                Ver
                                            </button>
                                        </td>
                                        <td>
                                            {{
                                                producto_categoria.cantidad_total
                                            }}
                                        </td>
                                        <td>
                                            {{
                                                producto_categoria.stock_actual
                                            }}
                                        </td>
                                        <td>
                                            {{
                                                producto_categoria.cantidad_despacho
                                            }}
                                        </td>
                                        <td
                                            :class="{
                                                'bg-danger text-white':
                                                    producto_categoria.stock_previsto <
                                                    0,
                                                bgVerificado2:
                                                    producto_categoria.stock_previsto ==
                                                    0,
                                            }"
                                        >
                                            {{
                                                producto_categoria.stock_previsto
                                            }}
                                        </td>
                                    </tr>
                                    <tr
                                        v-if="producto_categoria.ver"
                                        v-for="(
                                            pedido_detalle, fila_detalle
                                        ) in producto_categoria.pedido_detalles"
                                        :key="pedido_detalle.id"
                                    >
                                        <td class="bgVerificado2">
                                            {{
                                                pedido_detalle.pedido?.cliente
                                                    ?.nombre
                                            }}
                                        </td>
                                        <td class="bgVerificado2">
                                            <input
                                                type="number"
                                                class="form-control"
                                                v-model="
                                                    pedido_detalle.cantidad_total
                                                "
                                                @keyup="
                                                    modificaCantidadCliente(
                                                        $event,
                                                        fila_categoria,
                                                        fila_producto,
                                                        fila_detalle,
                                                    )
                                                "
                                            />
                                        </td>
                                        <td
                                            colspan="3"
                                            class="bgVerificado2"
                                        ></td>
                                    </tr>
                                </template>
                            </template>
                        </template>
                        <tr v-else>
                            <td colspan="6" class="text-center text-muted">
                                <span v-if="!distribuidor_id">
                                    Selecciona un Distribuidor
                                </span>
                                <span v-else
                                    >NO SE ENCONTRARÓN REGISTROS PARA ESTE
                                    DISTRIBUIDOR</span
                                >
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="col-md-6 offset-md-3">
                <button
                    class="btn btn-primary w-100"
                    :disabled="enviando"
                    @click="enviarFormulario"
                >
                    <i class="fa fa-save"></i> Registrar Despacho
                </button>
            </div>
        </div>
    </Content>
</template>
<style scoped></style>

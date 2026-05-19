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

const cargaDatos1 = ref(true);
const listCategoriaProductos = ref([]);
const listProductos = ref([]);

const cargarCategoriaProductos = () => {
    axios.get(route("categoria_productos.listado")).then((response) => {
        listCategoriaProductos.value = response.data.categoria_productos;
    });
};

const cargarProductosLista = () => {
    axios.get(route("productos.listado")).then((response) => {
        listProductos.value = response.data.productos;
    });
};

const filtro = ref({
    categoria_producto_id: "",
    producto_id: "",
});
const listProductosData = ref([]);
const cargarProductosData = () => {
    cargaDatos1.value = true;
    axios
        .get(route("productos.listadoStockBajo"), {
            params: filtro.value,
        })
        .then((response) => {
            listProductosData.value = response.data.productos;
        })
        .finally(() => {
            cargaDatos1.value = false;
        });
};

const actualizaStockPrevisto = (e, index) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);
    listProductosData.value[index].stock_previsto =
        parseFloat(listProductosData.value[index].stock_actual) + value;

    calculaTotalCosto(index);
};

const actualizaCostoFila = (e, index) => {
    const value = parseFloat(e.target.value ? e.target.value : 0);
    listProductosData.value[index].precio_compra = value;

    calculaTotalCosto(index);
};

const calculaTotalCosto = (index) => {
    listProductosData.value[index].total =
        parseFloat(
            listProductosData.value[index].cantidad
                ? listProductosData.value[index].cantidad
                : 0,
        ) *
        parseFloat(
            listProductosData.value[index].precio_compra
                ? listProductosData.value[index].precio_compra
                : 0,
        );
};

const cancelaCompra = (index) => {
    listProductosData.value[index].stock_previsto =
        listProductosData.value[index].stock_actual;
    listProductosData.value[index].total = 0;
    listProductosData.value[index].cantidad = 0;
    listProductosData.value[index].precio_compra = 0;
};

onMounted(async () => {
    cargarProductosData();
    cargarCategoriaProductos();
    cargarProductosLista();
    appStore.stopLoading();
});
</script>
<template>
    <Head title="Compras"></Head>

    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-clipboard-list"></i> Compras
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">Compras</li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>

        <div class="row">
            <div class="col-md-4">
                <el-select
                    v-model="filtro.categoria_producto_id"
                    filterable
                    placeholder="Categoría Producto"
                    clearable
                    @change="cargarProductosData"
                >
                    <el-option
                        v-for="item in listCategoriaProductos"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>
            </div>
            <div class="col-md-4">
                <el-select
                    v-model="filtro.producto_id"
                    filterable
                    placeholder="Producto"
                    clearable
                    @change="cargarProductosData"
                >
                    <el-option
                        v-for="item in listProductos"
                        :key="item.id"
                        :value="item.id"
                        :label="item.nombre"
                    ></el-option>
                </el-select>
            </div>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <button
                            v-if="
                                props_page.auth?.user.permisos == '*' ||
                                props_page.auth?.user.permisos.includes(
                                    'compra.create',
                                )
                            "
                            type="button"
                            class="btn btn-primary text-sm"
                            @click="agregarRegistro"
                        >
                            <i class="fa fa-plus"></i> Nueva Segmentación de
                            Zona
                        </button>
                    </div>
                    <div class="col-md-8 my-1"></div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="bg-principal">Producto</th>
                                    <th class="bg-principal">Stock Actual</th>
                                    <th class="bg-principal">Stock Previsto</th>
                                    <th class="bg-principal">
                                        Cantidad Ingreso Unidad
                                    </th>
                                    <th class="bg-principal">
                                        Precio Compra Unidad Bs.
                                    </th>
                                    <th class="bg-principal">
                                        Total Costo Bs.
                                    </th>
                                    <th class="bg-principal">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr
                                    v-for="(item, index) in listProductosData"
                                    :key="item.id"
                                >
                                    <td>{{ item.nombre }}</td>
                                    <td class="text-center">
                                        {{ item.stock_actual }}
                                    </td>
                                    <td class="text-center">
                                        {{ item.stock_previsto }}
                                    </td>
                                    <td class="p-0 px-1">
                                        <input
                                            type="number"
                                            step="1"
                                            class="form-control text-center"
                                            v-model="item.cantidad"
                                            @keyup="
                                                actualizaStockPrevisto(
                                                    $event,
                                                    index,
                                                )
                                            "
                                        />
                                    </td>
                                    <td class="p-0 px-1">
                                        <input
                                            type="number"
                                            step="0.01"
                                            class="form-control text-center"
                                            v-model="item.precio_compra"
                                            @keyup="
                                                actualizaCostoFila(
                                                    $event,
                                                    index,
                                                )
                                            "
                                        />
                                    </td>
                                    <td class="p-0 px-1 text-center">
                                        {{ item.total }}
                                    </td>
                                    <td class="p-0 px-1">
                                        <button
                                            class="btn btn-light btn-sm border"
                                            @click="cancelaCompra(index)"
                                        >
                                            <i class="fa fa-times"></i></button
                                        ><br />
                                        <button
                                            class="btn btn-primary btn-sm"
                                            v-if="
                                                item.precio_compra &&
                                                item.cantidad &&
                                                item.total &&
                                                item.precio_compra > 0 &&
                                                item.cantidad > 0 &&
                                                item.total > 0
                                            "
                                        >
                                            <i class="fa fa-save"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </Content>
</template>
<style scoped>
.filaZona {
    cursor: pointer;
}

.filaZona.seleccionado td {
    background-color: var(--bg2);
    color: white;
}

.filaZona.seleccionado:hover td {
    background-color: var(--bg2);
}

.filaUser:hover td,
.filaZona:hover td {
    background-color: var(--bgVerificado2);
}
</style>

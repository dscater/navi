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

onMounted(async () => {
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
                        <i class="fa fa-table"></i> Distribución de Pedidos
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
            <div class="col-md-12">
                <label class="required">Seleccionar Cliente</label>
                <el-select
                    v-model="cliente_id"
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

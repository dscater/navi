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
const cargaDatos2 = ref(true);
const cargaDatos3 = ref(true);

const listZonas = ref([]);
const cargarZonas = () => {
    cargaDatos1.value = true;
    axios
        .get(route("segmentacion_zonas.listado"))
        .then((response) => {
            listZonas.value = response.data.segmentacion_zonas;
        })
        .finally(() => {
            cargaDatos1.value = false;
        });
};

const listDistribuidors = ref([]);
const listVendedors = ref([]);
const cargarDistribuidors = () => {
    cargaDatos2.value = true;
    axios
        .get(route("usuarios.listadoAsignacions"), {
            params: {
                tipo: "DISTRIBUIDOR",
                zona_id: zona_selecionada.value?.id,
            },
        })
        .then((response) => {
            listDistribuidors.value = response.data.usuarios;
        })
        .finally(() => {
            cargaDatos2.value = false;
        });
};
const cargarVendedors = () => {
    cargaDatos3.value = true;
    axios
        .get(route("usuarios.listadoAsignacions"), {
            params: {
                tipo: "VENDEDOR",
                zona_id: zona_selecionada.value?.id,
            },
        })
        .then((response) => {
            listVendedors.value = response.data.usuarios;
        })
        .finally(() => {
            cargaDatos3.value = false;
        });
};

const zona_selecionada = ref(null);
const seleccionarZona = (item) => {
    if (zona_selecionada.value && zona_selecionada.value.id == item.id) {
        zona_selecionada.value = null;
        return;
    }
    zona_selecionada.value = item;

    cargarDistribuidors();
    cargarVendedors();
};

const updateAsignacion = async (e, user_id) => {
    if (!zona_selecionada.value) {
        toast.info("No se seleccionó una Zona");
        event.target.checked = !event.target.checked;
        return;
    }

    try {
        await axios.post(route("asignacion_zonas.store"), {
            user_id: user_id,
            segmentacion_zona_id: zona_selecionada.value.id,
            checked: e.target.checked,
        });
        toast.success("Registro actualizado!!!");

        cargarDistribuidors();
        cargarVendedors();
    } catch (error) {
        event.target.checked = !event.target.checked;
        toast.error(
            "Ocurrió un error inesperado. Por favor intente nuevamente",
        );
        console.log(error);
    }
};

onMounted(async () => {
    cargarZonas();
    cargarDistribuidors();
    cargarVendedors();
    appStore.stopLoading();
});
</script>
<template>
    <Head title="Asignación de Zonas"></Head>

    <Content>
        <template #header>
            <div class="row">
                <div class="col-sm-6">
                    <h3 class="m-0">
                        <i class="fa fa-table"></i> Asignación de Zonas
                    </h3>
                </div>
                <!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-end">
                        <li class="breadcrumb-item">
                            <Link :href="route('inicio')">Inicio</Link>
                        </li>
                        <li class="breadcrumb-item active">
                            Asignación de Zonas
                        </li>
                    </ol>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </template>

        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Lista de Zonas</h4>
                            </div>
                            <div class="card-body pt-1 px-2">
                                <table
                                    v-if="!cargaDatos1"
                                    class="table table-bordered"
                                >
                                    <thead>
                                        <tr>
                                            <th class="bg-principal" width="3%">
                                                Cód.
                                            </th>
                                            <th class="bg-principal">Zona</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            class="filaZona"
                                            v-for="item in listZonas"
                                            :key="item.id"
                                            @click="seleccionarZona(item)"
                                            :class="{
                                                seleccionado:
                                                    item.id ==
                                                    zona_selecionada?.id,
                                            }"
                                        >
                                            <td>
                                                {{ item.id }}
                                            </td>
                                            <td>{{ item.zona }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div
                                    v-else
                                    class="p-4 d-flex justify-content-center align-items-center"
                                >
                                    <i class="fa fa-spin fa-spinner fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    Distribuidores
                                    <span
                                        class="fs-5 fw-bold"
                                        v-if="zona_selecionada"
                                    >
                                        - {{ zona_selecionada.zona }}</span
                                    >
                                </h4>
                            </div>
                            <div class="card-body pt-1 px-2">
                                <table
                                    class="table table-bordered"
                                    v-if="!cargaDatos2"
                                >
                                    <thead>
                                        <tr>
                                            <th class="bg-principal">Nombre</th>
                                            <th class="bg-principal" width="3%">
                                                Asignación
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="item in listDistribuidors"
                                            :key="item.id"
                                            class="filaUser"
                                        >
                                            <td>{{ item.nombre }}</td>
                                            <td class="text-center">
                                                <input
                                                    type="checkbox"
                                                    class="checkboxForm"
                                                    :checked="item.asignado"
                                                    @click="
                                                        updateAsignacion(
                                                            $event,
                                                            item.id,
                                                        )
                                                    "
                                                    :disabled="
                                                        item.segmentacion_zona_id &&
                                                        zona_selecionada?.id !=
                                                            item.segmentacion_zona_id
                                                    "
                                                />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div
                                    v-else
                                    class="p-4 d-flex justify-content-center align-items-center"
                                >
                                    <i class="fa fa-spin fa-spinner fa-2x"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">
                                    Vendedores
                                    <span
                                        class="fs-5 fw-bold"
                                        v-if="zona_selecionada"
                                    >
                                        - {{ zona_selecionada.zona }}</span
                                    >
                                </h4>
                            </div>
                            <div class="card-body pt-1 px-2">
                                <table
                                    class="table table-bordered"
                                    v-if="!cargaDatos3"
                                >
                                    <thead>
                                        <tr>
                                            <th class="bg-principal">Nombre</th>
                                            <th class="bg-principal" width="3%">
                                                Asignación
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr
                                            v-for="item in listVendedors"
                                            :key="item.id"
                                            class="filaUser"
                                        >
                                            <td>{{ item.nombre }}</td>
                                            <td class="text-center">
                                                <input
                                                    type="checkbox"
                                                    class="checkboxForm"
                                                    :checked="item.asignado"
                                                    @click="
                                                        updateAsignacion(
                                                            $event,
                                                            item.id,
                                                        )
                                                    "
                                                    :disabled="
                                                        item.segmentacion_zona_id &&
                                                        zona_selecionada?.id !=
                                                            item.segmentacion_zona_id
                                                    "
                                                />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div
                                    v-else
                                    class="p-4 d-flex justify-content-center align-items-center"
                                >
                                    <i class="fa fa-spin fa-spinner fa-2x"></i>
                                </div>
                            </div>
                        </div>
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

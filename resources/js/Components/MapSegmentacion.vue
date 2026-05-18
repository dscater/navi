<script setup>
import L from "leaflet";
import "leaflet/dist/leaflet.css";

import "leaflet-draw/dist/leaflet.draw.css";
import "leaflet-draw";

import { onMounted, ref, watch } from "vue";

const props = defineProps({
    areas: {
        type: Array,
        default: () => [],
    },

    color: {
        type: String,
        default: "#3388ff",
    },

    zoom: {
        type: Number,
        default: 13,
    },

    latitud: {
        type: Number,
        default: -16.125102,
    },

    longitud: {
        type: Number,
        default: -67.196268,
    },
});

const emit = defineEmits(["update:areas"]);

const mapa = ref(null);

let map = null;
let drawnItems = null;

const obtenerDatos = () => {
    const nuevasAreas = [];

    drawnItems.eachLayer((layer) => {
        if (layer instanceof L.Polygon) {
            const coordenadas = layer.getLatLngs()[0].map((p) => ({
                lat: p.lat,
                lng: p.lng,
            }));

            nuevasAreas.push({
                color: layer.options.color,
                coordenadas,
            });
        }
    });

    emit("update:areas", nuevasAreas);
};

let drawControl = null;
const crearControles = () => {
    if (drawControl) {
        map.removeControl(drawControl);
    }

    drawControl = new L.Control.Draw({
        edit: {
            featureGroup: drawnItems,
        },

        draw: {
            polygon: true,
            rectangle: false,
            circle: false,
            marker: false,
            polyline: false,
            circlemarker: false,
        },
    });
    map.addControl(drawControl);
};

watch(
    () => props.color,
    (nuevoColor) => {
        actualizarColorDrawer();
    },
);

onMounted(() => {
    map = L.map(mapa.value).setView(
        [props.latitud, props.longitud],
        props.zoom,
    );

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution: "&copy; OpenStreetMap",
    }).addTo(map);

    drawnItems = new L.FeatureGroup();

    map.addLayer(drawnItems);

    // CARGAR AREAS EXISTENTES
    props.areas.forEach((area) => {
        const polygon = L.polygon(
            area.coordenadas.map((p) => [p.lat, p.lng]),
            {
                color: props.color,
                fillColor: props.color,
                fillOpacity: 0.4,
            },
        );

        drawnItems.addLayer(polygon);
    });

    crearControles();

    map.addControl(drawControl);

    // CREAR
    map.on(L.Draw.Event.CREATED, (event) => {
        const layer = event.layer;

        // APLICAR COLOR ACTUAL
        layer.setStyle({
            color: props.color,
            fillColor: props.color,
            fillOpacity: 0.4,
        });

        drawnItems.addLayer(layer);

        obtenerDatos();
    });

    // EDITAR
    map.on(L.Draw.Event.EDITED, () => {
        obtenerDatos();
    });

    // ELIMINAR
    map.on(L.Draw.Event.DELETED, () => {
        obtenerDatos();
    });
});

const actualizarColorDrawer = () => {
    const polygonHandler = drawControl._toolbars.draw._modes.polygon.handler;

    polygonHandler.setOptions({
        shapeOptions: {
            color: props.color,
            fillColor: props.color,
            fillOpacity: 0.4,
        },
    });
};
</script>

<template>
    <div ref="mapa" class="mapa"></div>
</template>

<style scoped>
.mapa {
    width: 100%;
    height: 500px;
}
</style>

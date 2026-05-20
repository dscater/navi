import { useForm } from "@inertiajs/vue3";
import { onMounted, ref } from "vue";

export const usePedidos = () => {
    const initialState = {
        id: 0,
        user_id: "",
        segmentacion_zona_id: "",
        cliente_id: "",
        despacho_id: "",
        subtotal: "",
        descuento: 0,
        total: "",
        fecha: "",
        hora: "",
        observacion: "",
        estado: "",
        status: "",
        pedido_detalles: [],
        eliminados: [],
        _method: "POST",
    };

    const form = useForm({ ...initialState });

    const setPedido = (item = null, ver = false) => {
        form.clearErrors();
        form.reset();
        Object.assign(form, item);
        form._method = "PUT";
    };

    const limpiarPedido = () => {
        form.clearErrors();
        form.reset();
        form.defaults({ ...initialState });
    };

    onMounted(() => {});

    return {
        form,
        setPedido,
        limpiarPedido,
    };
};

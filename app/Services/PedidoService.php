<?php

namespace App\Services;

use App\Services\HistorialAccionService;
use App\Models\Pedido;
use App\Models\PedidoDetalle;
use App\Models\Producto;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class PedidoService
{
    private $modulo = "PEDIDOS";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService, private MovimientoInventarioService $movimiento_inventario_service, private UserService $user_service, private ProductoService $producto_service) {}

    public function listado(): Collection
    {
        $pedidos = Pedido::select("pedidos.*")
            ->where("status", 1)->get();
        return $pedidos;
    }
    /**
     * Lista de pedidos paginado con filtros
     *
     * @param integer $length
     * @param integer $page
     * @param string $search
     * @param array $columnsSerachLike
     * @param array $columnsFilter
     * @return LengthAwarePaginator
     */
    public function listadoPaginado(int $length, int $page, string $search, array $columnsSerachLike = [], array $columnsFilter = [], array $columnsBetweenFilter = [], array $orderBy = []): LengthAwarePaginator
    {
        $pedidos = Pedido::select("pedidos.*")
            ->with(["cliente:id,nombre,razon_social", "segmentacion_zona:id,zona"])
            ->where("status", 1);


        if (Auth::user()->tipo != 'ADMINISTRADOR') {
            $segmentacion_zona = $this->user_service->getSegmentacionZona(Auth::user()->id);
            $pedidos->where("segmentacion_zona_id", $segmentacion_zona->id);
        }

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $pedidos->where("pedidos.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $pedidos->whereBetween("pedidos.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $pedidos->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $pedidos->orderBy($value[0], $value[1]);
            }
        }


        $pedidos = $pedidos->paginate($length, ['*'], 'page', $page);
        return $pedidos;
    }

    /**
     * Crear pedido
     *
     * @param array $datos
     * @return Pedido
     */
    public function crear(array $datos): Pedido
    {

        $fecha_actual = Carbon::now("America/La_Paz")->format("Y-m-d");
        $hora_actual = Carbon::now("America/La_Paz")->format("H:i:s");

        $pedido = Pedido::create([
            "cliente_id" => $datos["cliente_id"],
            "subtotal" => $datos["subtotal"],
            "descuento" => $datos["descuento"],
            "total" => $datos["total"],
            "observacion" => $datos["observacion"],
            "user_id" => Auth::user()->id,
            "segmentacion_zona_id" => $this->user_service->getSegmentacionZona(Auth::user()->id)->id,
            "fecha" => $fecha_actual,
            "hora" => $hora_actual,
        ]);

        // DETALLES
        foreach ($datos["pedido_detalles"] as $item) {
            $producto = Producto::findOrFail($item["producto_id"]);
            $datos_detalle = [
                "producto_id" => $item["producto_id"],
                "categoria_producto_id" => $producto->categoria_producto_id,
                "presentacion_producto_id" => $item["presentacion_producto_id"],
                "cantidad" => $item["cantidad"],
                "cantidad_total" => $item["cantidad_total"],
                "cantidad_despacho" => 0,
                "cantidad_entregado" => 0,
                "cantidad_devolucion" => 0,
                "precio" => $item["precio"],
                "subtotal" => $item["subtotal"],
            ];

            $pedido->pedido_detalles()->create($datos_detalle);
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UN PEDIDO", $pedido);

        return $pedido;
    }

    /**
     * Actualizar pedido
     *
     * @param array $datos
     * @param Pedido $pedido
     * @return Pedido
     */
    public function actualizar(array $datos, Pedido $pedido): Pedido
    {
        $old_pedido = clone $pedido;

        $pedido->update([
            "cliente_id" => $datos["cliente_id"],
            "subtotal" => $datos["subtotal"],
            "descuento" => $datos["descuento"],
            "total" => $datos["total"],
            "observacion" => $datos["observacion"],
        ]);

        // DETALLES
        foreach ($datos["pedido_detalles"] as $item) {
            $producto = Producto::findOrFail($item["producto_id"]);
            $datos_detalle = [
                "producto_id" => $item["producto_id"],
                "categoria_producto_id" => $producto->categoria_producto_id,
                "presentacion_producto_id" => $item["presentacion_producto_id"],
                "cantidad" => $item["cantidad"],
                "cantidad_total" => $item["cantidad_total"],
                "cantidad_despacho" => 0,
                "cantidad_entregado" => 0,
                "cantidad_devolucion" => 0,
                "precio" => $item["precio"],
                "subtotal" => $item["subtotal"],
            ];
            if ($item["id"] == 0) {
                $pedido->pedido_detalles()->create($datos_detalle);
            } else {
                $pedido_detalle = PedidoDetalle::find($item["id"]);
                $pedido_detalle->update($datos_detalle);
            }
        }

        if (isset($datos["eliminados"])) {
            foreach ($datos["eliminados"] as $value) {
                $pedido_detalle = PedidoDetalle::find($value);
                $pedido_detalle->delete();
            }
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN PEDIDO", $old_pedido, $pedido->withoutRelations());

        return $pedido;
    }

    /**
     * Eliminar pedido
     *
     * @param Pedido $pedido
     * @return boolean
     */
    public function eliminar(Pedido $pedido): bool|Exception
    {
        // TODO: VERIFICAR RELACIONES

        $old_pedido = clone $pedido;
        $pedido->status = 0;
        $pedido->save();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UN PEDIDO", $old_pedido, $pedido);

        return true;
    }
}

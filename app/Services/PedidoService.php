<?php

namespace App\Services;

use App\Models\CategoriaProducto;
use App\Models\Cliente;
use App\Services\HistorialAccionService;
use App\Models\Pedido;
use App\Models\PedidoDetalle;
use App\Models\Producto;
use App\Models\PresentacionProducto;
use App\Models\User;
use App\Models\Despacho;
use Carbon\Carbon;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;

class PedidoService
{
    private $modulo = "PEDIDOS";

    public function __construct(
        private  CargarArchivoService $cargarArchivoService,
        private HistorialAccionService $historialAccionService,
        private MovimientoInventarioService $movimiento_inventario_service,
        private UserService $user_service,
        private ProductoService $producto_service,
        private AsignacionZonaService $asignacion_zona_service
    ) {}

    public function listado(): Collection
    {
        $pedidos = Pedido::select("pedidos.*")
            ->where("status", 1)->get();
        return $pedidos;
    }

    public function totalPedidos($estado_pedido, $fecha_ini, $fecha_fin)
    {
        $pedidos = Pedido::select("pedidos.*")
            ->where("status", 1);

        if (Auth::user()->tipo != 'ADMINISTRADOR') {
            $segmentacion_zona_ids = $this->user_service->getSegmentacionZona(Auth::user()->id);
            $pedidos->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
        }

        if ($estado_pedido) {
            $pedidos->where("estado", $estado_pedido);
        }

        if ($fecha_ini && $fecha_fin) {
            $pedidos->whereBetween("fecha", [$fecha_ini, $fecha_fin]);
        }

        if (Auth::user()->tipo == 'DISTRIBUIDOR') {
            $pedidos->where("user_distribucion_id", Auth::user()->id);
        }

        return $pedidos->sum("total");
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
    public function listadoPaginado(int $length, int $page, string $fecha_ini, $fecha_fin, array $orderBy = []): LengthAwarePaginator
    {
        $pedidos = Pedido::select("pedidos.*")
            ->with(["cliente.tipo_negocio", "segmentacion_zona:id,zona"])
            ->where("status", 1);


        if (Auth::user()->tipo != 'ADMINISTRADOR') {
            $segmentacion_zona_ids = $this->user_service->getSegmentacionZona(Auth::user()->id);
            $pedidos->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
        }


        if ($fecha_ini && $fecha_fin) {
            $pedidos->whereBetween("fecha", [$fecha_ini, $fecha_fin]);
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

    public function listadoPaginadoDistribucion(int $length, int $page, string $search, array $columnsSerachLike = [], array $columnsFilter = [], array $columnsBetweenFilter = [], array $orderBy = []): LengthAwarePaginator
    {
        $pedidos = Pedido::select("pedidos.*")
            ->with([
                "cliente:id,nombre,razon_social",
                "cliente.tipo_negocio",
                "user",
                "segmentacion_zona:id,zona"
            ]);
        // ->where("status", 1)
        // ->whereNotNull("despacho_id");
        // ->where("estado", "ENTREGADO");

        if (Auth::user()->tipo != 'ADMINISTRADOR') {
            $segmentacion_zona_ids = $this->user_service->getSegmentacionZona(Auth::user()->id);
            $pedidos->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
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

    public function listadoPaginadoSalida(int $length, int $page, string $distribuidor_id, $fecha_ini, $fecha_fin, $orderBy = []): LengthAwarePaginator
    {
        $pedidos = Pedido::select("pedidos.*")
            ->with([
                "cliente:id,nombre,razon_social",
                "cliente.tipo_negocio",
                "user_distribucion",
                "segmentacion_zona:id,zona"
            ])
            ->where("status", 1)
            ->whereNotNull("user_distribucion_id");
        // ->where("estado", "ENTREGADO");

        if (Auth::user()->tipo != 'ADMINISTRADOR') {
            $segmentacion_zona_ids = $this->user_service->getSegmentacionZona(Auth::user()->id);
            $pedidos->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
        }


        if ($distribuidor_id) {
            $pedidos->where("user_distribucion_id", $distribuidor_id);
        }

        if ($fecha_ini && $fecha_fin) {
            $pedidos->whereBetween("fecha_salida", [$fecha_ini, $fecha_fin]);
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

        // if (Auth::user()->tipo != 'ADMINISTRADOR') {
        //     $segmentacion_zona_id =  $this->user_service->getSegmentacionZona(Auth::user()->id)->id;
        // } else {
        //     $segmentacion_zona_id =  $this->user_service->getSegmentacionZona($datos["distribuidor_id"])->id;
        // }

        $cliente = Cliente::findOrFail($datos["cliente_id"]);

        $distribuidor = $this->asignacion_zona_service->getDistribuidorPorSegmentacionZona($cliente->segmentacion_zona_id);
        if (!$distribuidor) {
            throw ValidationException::withMessages(['No se encontró un distribuidor en la ubicación del Cliente.']);
        }

        $pedido = Pedido::create([
            "distribuidor_id" => $distribuidor ? $distribuidor->id : null,
            "cliente_id" => $datos["cliente_id"],
            "subtotal" => $datos["subtotal"],
            "descuento" => $datos["descuento"],
            "total" => $datos["total"],
            "observacion" => $datos["observacion"],
            "user_id" => Auth::user()->id,
            "segmentacion_zona_id" => $cliente->segmentacion_zona_id,
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
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UN PEDIDO", $pedido, null, ["pedido_detalles"]);

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

        // if (Auth::user()->tipo == 'ADMINISTRADOR') {
        //     $segmentacion_zona_id =  $this->user_service->getSegmentacionZona($datos["distribuidor_id"])->id;
        // }

        $cliente = Cliente::findOrFail($datos["cliente_id"]);

        $distribuidor = $this->asignacion_zona_service->getDistribuidorPorSegmentacionZona($cliente->segmentacion_zona_id);
        if (!$distribuidor) {
            throw ValidationException::withMessages(['No se encontró un distribuidor en la ubicación del Cliente.']);
        }

        $pedido->update([
            "distribuidor_id" => $distribuidor ? $distribuidor->id : null,
            "cliente_id" => $datos["cliente_id"],
            "subtotal" => $datos["subtotal"],
            "descuento" => $datos["descuento"],
            "total" => $datos["total"],
            "segmentacion_zona_id" => $cliente->segmentacion_zona_id,
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
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UN PEDIDO", $old_pedido, $pedido->withoutRelations(), ["pedido_detalles"]);

        return $pedido;
    }

    public function distribucion_pedido(array $datos, Pedido $pedido): Pedido
    {
        $old_pedido = clone $pedido;

        $despacho = Despacho::findOrFail($pedido->despacho_id);

        $pedido->update([
            "distribuidor_id" => $despacho->distribuidor_id,
            // "user_distribucion_id" => Auth::user()->id,
            "subtotal" => $datos["subtotal"],
            "descuento" => $datos["descuento"],
            "total" => $datos["total"],
            "observacion" => $datos["observacion"],
            "tipo_pago" => $datos["tipo_pago"],
            "estado" => "ENTREGADO"
        ]);

        // DETALLES
        foreach ($datos["pedido_detalles"] as $item) {
            $producto = Producto::findOrFail($item["producto_id"]);
            $datos_detalle = [
                "producto_id" => $item["producto_id"],
                "categoria_producto_id" => $producto->categoria_producto_id,
                "presentacion_producto_id" => $item["presentacion_producto_id"],
                "cantidad" => $item["cantidad"],
                "cantidad_entregado" => $item["cantidad_entregado"],
                "cantidad_devolucion" => (float)$item["cantidad_despacho"] - (float)$item["cantidad_entregado"],
                "precio" => $item["precio"],
                "subtotal" => $item["subtotal"],
            ];
            $pedido_detalle = PedidoDetalle::find($item["id"]);
            $pedido_detalle->update($datos_detalle);
        }

        if (isset($datos["eliminados"])) {
            foreach ($datos["eliminados"] as $value) {
                $pedido_detalle = PedidoDetalle::find($value);
                $pedido_detalle->cantidad_devolucion = $pedido_detalle->cantidad_despacho;
                $pedido_detalle->status = 2; // ELIMINADO POR DISTRIBUCIÓN
                $pedido_detalle->save();
            }
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ENTREGÓ UN PEDIDO", $old_pedido, $pedido->withoutRelations(), ["pedido_detalles"]);

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

    public function anularPedido(Pedido $pedido): Pedido
    {
        $old_pedido = clone $pedido;
        $pedido->status = 0;
        $pedido->estado = "ANULADO";
        $pedido->save();

        // DETALLES
        foreach ($pedido->pedido_detalles as $item) {
            $producto = Producto::findOrFail($item->producto_id);
            $pedido_detalle = PedidoDetalle::find($item->id);
            $presentacionProducto = PresentacionProducto::findOrFail($pedido_detalle->presentacion_producto_id);
            $this->movimiento_inventario_service->registrarMovimiento("PedidoDetalle", "INGRESO", $producto, $pedido_detalle->cantidad_despacho, $presentacionProducto->precio, "Por anulación de pedido", "PedidoDetalle", $pedido_detalle->id);
        }

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ANULÓ UN PEDIDO", $old_pedido, $pedido);

        return $pedido;
    }

    public function pedido_distribuidor($despacho_id = null, $segmentacion_zona_ids = null, $estado = null, $valida_despacho = false)
    {
        return CategoriaProducto::whereHas("pedido_detalles", function ($q) use ($segmentacion_zona_ids, $estado, $despacho_id, $valida_despacho) {
            $q->whereHas("pedido", function ($sub) use ($segmentacion_zona_ids, $estado, $despacho_id, $valida_despacho) {
                if ($despacho_id) {
                    $sub->where("despacho_id", $despacho_id);
                }
                if ($segmentacion_zona_ids !== null) {
                    $sub->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
                }
                if ($estado) {
                    $sub->where("estado", $estado);
                }
                if ($valida_despacho) {
                    $sub->where("despacho_id", null);
                }
                $sub->where("status", 1);
            });
        })->distinct()
            ->orderBy("nombre", "asc")->get()
            ->map(function ($categoria) use ($segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                $categoria->productos = Producto::whereHas("pedido_detalles", function ($q) use ($categoria, $segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                    $q->where("categoria_producto_id", $categoria->id);
                    $q->whereHas("pedido", function ($sub) use ($segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                        if ($despacho_id) {
                            $sub->where("despacho_id", $despacho_id);
                        }
                        if ($segmentacion_zona_ids !== null) {
                            $sub->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
                        }
                        if ($estado) {
                            $sub->where("estado", $estado);
                        }
                        if ($valida_despacho) {
                            $sub->where("despacho_id", null);
                        }
                        $sub->where("status", 1);
                    });
                })->orderBy("nombre", "asc")
                    ->get()
                    ->map(function ($producto) use ($segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                        $producto->ver = false;

                        $producto->pedido_detalles = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($segmentacion_zona_ids !== null) {
                                $q->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
                            }
                            if ($estado) {
                                $q->where("estado", $estado);
                            }
                            if ($valida_despacho) {
                                $q->where("despacho_id", null);
                            }
                            $q->where("status", 1);
                        })->where("producto_id", $producto->id)->get();

                        $producto->cantidad_total = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($segmentacion_zona_ids, $estado, $valida_despacho, $despacho_id) {
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($segmentacion_zona_ids !== null) {
                                $q->whereIn("segmentacion_zona_id", $segmentacion_zona_ids);
                            }
                            if ($estado) {
                                $q->where("estado", $estado);
                            }
                            if ($valida_despacho) {
                                $q->where("despacho_id", null);
                            }
                            $q->where("status", 1);
                        })->where("producto_id", $producto->id)->sum("cantidad_total");
                        $producto->cantidad_despacho = $producto->cantidad_total;
                        $producto->stock_previsto = $producto->stock_actual - $producto->cantidad_despacho;
                        return $producto;
                    });
                return $categoria;
            });
    }

    public function pedidos_despacho($consolidado_id = null, $despacho_id = null, $estado = "", $detalles = false)
    {
        return CategoriaProducto::whereHas("pedido_detalles", function ($q) use ($consolidado_id, $despacho_id, $estado, $detalles) {
            $q->whereHas("pedido", function ($sub) use ($consolidado_id, $despacho_id, $estado) {
                if ($consolidado_id) {
                    $sub->where("consolidado_id", $consolidado_id);
                }
                if ($despacho_id) {
                    $sub->where("despacho_id", $despacho_id);
                }
                $sub->whereHas("despacho", function ($sub2) use ($estado) {
                    if ($estado) {
                        $sub2->where("estado", $estado);
                    }
                });
                $sub->where("status", 1);
            });
        })->distinct()
            ->orderBy("nombre", "asc")->get()
            ->map(function ($categoria) use ($consolidado_id, $despacho_id, $estado, $detalles) {
                $categoria->productos = Producto::whereHas("pedido_detalles", function ($q) use ($categoria, $consolidado_id, $despacho_id, $estado, $detalles) {
                    $q->where("categoria_producto_id", $categoria->id);
                    $q->whereHas("pedido", function ($sub) use ($consolidado_id, $despacho_id, $estado) {
                        if ($consolidado_id) {
                            $sub->where("consolidado_id", $consolidado_id);
                        }
                        if ($despacho_id) {
                            $sub->where("despacho_id", $despacho_id);
                        }
                        if ($estado) {
                            $sub->whereHas("despacho", function ($sub2) use ($estado) {
                                $sub2->where("estado", $estado);
                            });
                        }
                        $sub->where("status", 1);
                    });
                })->orderBy("nombre", "asc")
                    ->get()
                    ->map(function ($producto) use ($consolidado_id, $despacho_id, $estado, $detalles) {
                        $producto->ver = $detalles;

                        $producto->pedido_detalles = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($consolidado_id, $despacho_id, $estado) {
                            if ($consolidado_id) {
                                $q->where("consolidado_id", $consolidado_id);
                            }
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($estado) {
                                $q->whereHas("despacho", function ($sub2) use ($estado) {
                                    $sub2->where("estado", $estado);
                                });
                            }
                            $q->where("status", 1);
                        })
                            ->where("producto_id", $producto->id)->get();

                        $producto->cantidad_despacho = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($consolidado_id, $despacho_id, $estado) {
                            if ($consolidado_id) {
                                $q->where("consolidado_id", $consolidado_id);
                            }
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($estado) {
                                $q->whereHas("despacho", function ($sub2) use ($estado) {
                                    $sub2->where("estado", $estado);
                                });
                            }
                            $q->where("status", 1);
                        })
                            ->where("producto_id", $producto->id)->sum("cantidad_despacho");

                        $producto->cantidad_entregado = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($consolidado_id, $despacho_id, $estado) {
                            if ($consolidado_id) {
                                $q->where("consolidado_id", $consolidado_id);
                            }
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($estado) {
                                $q->whereHas("despacho", function ($sub2) use ($estado) {
                                    $sub2->where("estado", $estado);
                                });
                            }
                            $q->where("status", 1);
                        })
                            ->where("producto_id", $producto->id)->sum("cantidad_entregado");

                        $producto->cantidad_devolucion = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($consolidado_id, $despacho_id, $estado) {
                            if ($consolidado_id) {
                                $q->where("consolidado_id", $consolidado_id);
                            }
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($estado) {
                                $q->whereHas("despacho", function ($sub2) use ($estado) {
                                    $sub2->where("estado", $estado);
                                });
                            }
                            $q->where("status", 1);
                        })
                            ->where("producto_id", $producto->id)->sum("cantidad_devolucion");

                        $producto->subtotal = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($consolidado_id, $despacho_id, $estado) {
                            if ($consolidado_id) {
                                $q->where("consolidado_id", $consolidado_id);
                            }
                            if ($despacho_id) {
                                $q->where("despacho_id", $despacho_id);
                            }
                            if ($estado) {
                                $q->whereHas("despacho", function ($sub2) use ($estado) {
                                    $sub2->where("estado", $estado);
                                });
                            }
                            $q->where("status", 1);
                        })
                            ->where("producto_id", $producto->id)->sum("subtotal");

                        return $producto;
                    });
                return $categoria;
            });
    }

    public function asignar_pedidos($data)
    {
        $distribuidor_id = $data["distribuidor_id"];
        $ids = $data["ids"];

        // Log::debug($distribuidor_id);
        // Log::debug($ids);
        foreach ($ids as $id) {
            $pedido = Pedido::find($id);

            $pedido->user_distribucion_id = $distribuidor_id;
            $pedido->fecha_salida = date("Y-m-d");
            $pedido->hora_salida = date("H:i:s");

            $pedido->save();
        }
    }
}

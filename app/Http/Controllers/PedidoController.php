<?php

namespace App\Http\Controllers;

use App\Http\Requests\PedidoStoreRequest;
use App\Http\Requests\PedidoUpdateRequest;
use App\Models\CategoriaProducto;
use App\Models\Pedido;
use App\Models\PedidoDetalle;
use App\Models\Producto;
use App\Models\User;
use App\Services\PedidoService;
use App\Services\UserService;
use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;
use Inertia\Response as ResponseInertia;

class PedidoController extends Controller
{
    public function __construct(private PedidoService $pedidoService, private UserService $user_service) {}

    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/Pedidos/Index");
    }

    /**
     * Listado de pedidos
     *
     * @return JsonResponse
     */
    public function listado(): JsonResponse
    {
        return response()->JSON([
            "pedidos" => $this->pedidoService->listado()
        ]);
    }


    public function pedidos_distruibidor(Request $request): JsonResponse
    {
        $segmentacion_zona = $this->user_service->getSegmentacionZona($request->distribuidor_id);

        $categoria_productos = CategoriaProducto::whereHas("pedido_detalles", function ($q) use ($segmentacion_zona) {
            $q->whereHas("pedido", function ($sub) use ($segmentacion_zona) {
                $sub->where("segmentacion_zona_id", $segmentacion_zona->id);
                $sub->where("estado", "PENDIENTE");
                $sub->where("despacho_id", null);
            });
        })->groupBy("id")
            ->orderBy("nombre", "asc")->get()
            ->map(function ($categoria) use ($segmentacion_zona) {
                $categoria->productos = Producto::whereHas("pedido_detalles", function ($q) use ($categoria, $segmentacion_zona) {
                    $q->where("categoria_producto_id", $categoria->id);
                    $q->whereHas("pedido", function ($sub) use ($segmentacion_zona) {
                        $sub->where("segmentacion_zona_id", $segmentacion_zona->id);
                        $sub->where("estado", "PENDIENTE");
                        $sub->where("despacho_id", null);
                    });
                })->orderBy("nombre", "asc")
                    ->get()
                    ->map(function ($producto) use ($segmentacion_zona) {
                        $producto->ver = false;

                        $producto->pedido_detalles = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($segmentacion_zona) {
                            $q->where("segmentacion_zona_id", $segmentacion_zona->id);
                            $q->where("estado", "PENDIENTE");
                            $q->where("despacho_id", null);
                        })
                            ->where("producto_id", $producto->id)->get();

                        $producto->cantidad_total = PedidoDetalle::with("pedido.cliente")->whereHas("pedido", function ($q) use ($segmentacion_zona) {
                            $q->where("segmentacion_zona_id", $segmentacion_zona->id);
                            $q->where("estado", "PENDIENTE");
                            $q->where("despacho_id", null);
                        })
                            ->where("producto_id", $producto->id)->sum("cantidad_total");

                        $producto->cantidad_despacho = $producto->cantidad_total;
                        $producto->stock_previsto = $producto->stock_actual - $producto->cantidad_despacho;
                        return $producto;
                    });;
                return $categoria;
            });

        return response()->JSON([
            "categoria_productos" => $categoria_productos,
        ]);
    }



    public function byCi(Request $request)
    {
        $ci = $request->input("ci", "");
        $pedidos = Pedido::where("ci", $ci)->get();
        return response()->JSON($pedidos);
    }

    public function paginado(Request $request)
    {
        $perPage = $request->perPage;
        $page = (int)($request->input("page", 1));
        $search = (string)$request->input("search", "");
        $orderBy = $request->orderBy;
        $orderAsc = $request->orderAsc;

        $columnsSerachLike = [
            "ci",
        ];
        $columnsFilter = [];
        $columnsBetweenFilter = [];
        $arrayOrderBy = [];
        if ($orderBy && $orderAsc) {
            $arrayOrderBy = [
                [$orderBy, $orderAsc]
            ];
        }

        $pedidos = $this->pedidoService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $pedidos->items(),
            "total" => $pedidos->total(),
            "lastPage" => $pedidos->lastPage()
        ]);
    }
    /**
     * Página create
     *
     * @return Response
     */
    public function create(): ResponseInertia
    {
        return Inertia::render("Admin/Pedidos/Create");
    }
    /**
     * Registrar un nuevo pedido
     *
     * @param PedidoStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(PedidoStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Pedido
            $this->pedidoService->crear($request->validated());
            DB::commit();
            return redirect()->route("pedidos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Mostrar un pedido
     *
     * @param Pedido $pedido
     * @return JsonResponse
     */
    public function show(Pedido $pedido): JsonResponse
    {
        return response()->JSON($pedido);
    }
    /**
     * Página edit
     *
     * @return Response
     */
    public function edit(Pedido $pedido): ResponseInertia
    {
        $pedido = $pedido->load(["pedido_detalles.producto", "pedido_detalles.presentacion_producto"]);
        return Inertia::render("Admin/Pedidos/Edit", compact("pedido"));
    }
    public function update(Pedido $pedido, PedidoUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar pedido
            $this->pedidoService->actualizar($request->validated(), $pedido);
            DB::commit();
            return redirect()->route("pedidos.index")->with("bien", "Registro actualizado");
        } catch (\Exception $e) {
            DB::rollBack();
            // Log::debug($e->getMessage());
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Eliminar pedido
     *
     * @param Pedido $pedido
     * @return JsonResponse|Response
     */
    public function destroy(Pedido $pedido): JsonResponse|Response
    {
        DB::beginTransaction();
        try {
            $this->pedidoService->eliminar($pedido);
            DB::commit();
            return response()->JSON([
                'sw' => true,
                'message' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}

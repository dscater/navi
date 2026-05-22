<?php

namespace App\Http\Controllers;

use App\Http\Requests\PedidoStoreRequest;
use App\Http\Requests\PedidoUpdateRequest;
use App\Models\CategoriaProducto;
use App\Models\Pedido;
use App\Models\PedidoDetalle;
use App\Models\Producto;
use App\Models\Configuracion;
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
use PDF;
use App\library\numero_a_letras\src\NumeroALetras;

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

    public function listadoByCliente(Request $request): JsonResponse
    {
        $pedidos = Pedido::where("cliente_id", $request->cliente_id)
            ->where("estado", "PENDIENTE")
            ->whereNotNull("despacho_id")
            ->get();
        return response()->JSON([
            "pedidos" => $pedidos
        ]);
    }

    public function pedidos_distruibidor(Request $request): JsonResponse
    {
        $segmentacion_zona = $this->user_service->getSegmentacionZona($request->distribuidor_id);

        $categoria_productos = $this->pedidoService->pedido_distribuidor(null, $segmentacion_zona, "PENDIENTE", true);
        return response()->JSON([
            "categoria_productos" => $categoria_productos,
        ]);
    }

    public function pedidos_despacho(Request $request): JsonResponse
    {
        // $segmentacion_zona = $this->user_service->getSegmentacionZona($request->distribuidor_id);

        $categoria_productos = $this->pedidoService->pedidos_despacho(null, null, $request->estado, (bool)$request->detalles);

        return response()->JSON([
            "categoria_productos" => $categoria_productos,
        ]);
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
            $pedido = $this->pedidoService->crear($request->validated());
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
        return response()->JSON($pedido->load(["pedido_detalles.producto", "pedido_detalles.presentacion_producto"]));
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
    /**
     * Página ver
     *
     * @return Response
     */
    public function ver(Pedido $pedido): ResponseInertia
    {
        $pedido = $pedido->load(["pedido_detalles.producto", "pedido_detalles.presentacion_producto", "cliente"]);
        return Inertia::render("Admin/Pedidos/Ver", compact("pedido"));
    }

    public function pdf(Pedido $pedido)
    {
        $pedido = $pedido->load([
            "pedido_detalles.producto",
            "pedido_detalles.presentacion_producto",
            "cliente",
            "user_distribucion",
        ]);

        $configuracion = Configuracion::get()->first();
        // CANTIDAD DE ITEMS
        $cantidadItems = $pedido->pedido_detalles->count();
        $baseHeight = 260; // cabecera + totales
        $itemHeight = 70; // espacio por item

        $alto = $baseHeight + ($cantidadItems * $itemHeight);

        /*
        |--------------------------------------------------------------------------
        | TAMAÑO PAPEL TÉRMICO 80mm
        |--------------------------------------------------------------------------
        */

        $customPaper = [0, 0, 226.77, $alto];


        $convertir = new NumeroALetras();
        $array_monto = explode('.', number_format($pedido->total, 2, '.', ''));
        $literal = $convertir->convertir($array_monto[0]);
        $literal .= " " . $array_monto[1] . "/100." . " BOLIVIANOS";
        // primero todo a minúsculas
        $literal = strtolower($literal);

        // luego primera letra mayúscula
        $literal = ucfirst($literal);
        $pdf = PDF::loadView(
            'reportes.pedido_termico',
            compact('pedido', 'configuracion', 'literal')
        )->setPaper($customPaper);

        return $pdf->stream('pedido_termico.pdf');
    }

    public function update(Pedido $pedido, PedidoUpdateRequest $request)
    {
        DB::beginTransaction();
        try {
            // actualizar pedido
            $pedido = $this->pedidoService->actualizar($request->validated(), $pedido);
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

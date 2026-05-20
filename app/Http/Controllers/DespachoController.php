<?php

namespace App\Http\Controllers;

use App\Http\Requests\DespachoStoreRequest;
use App\Services\DespachoService;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response as ResponseInertia;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Illuminate\Validation\ValidationException;

class DespachoController extends Controller
{
    public function __construct(private DespachoService $despachoService) {}
    /**
     * Página index
     *
     * @return Response
     */
    public function index(): ResponseInertia
    {
        return Inertia::render("Admin/Despachos/Index");
    }


    public function paginado(Request $request)
    {
        $perPage = $request->perPage;
        $page = (int)($request->input("page", 1));
        $search = (string)$request->input("search", "");
        $orderBy = $request->orderBy;
        $orderAsc = $request->orderAsc;

        $columnsSerachLike = [
            "id",
        ];
        $columnsFilter = [];
        $columnsBetweenFilter = [];
        $arrayOrderBy = [];
        if ($orderBy && $orderAsc) {
            $arrayOrderBy = [
                [$orderBy, $orderAsc]
            ];
        }

        $clientes = $this->despachoService->listadoPaginado($perPage, $page, $search, $columnsSerachLike, $columnsFilter, $columnsBetweenFilter, $arrayOrderBy);
        return response()->JSON([
            "data" => $clientes->items(),
            "total" => $clientes->total(),
            "lastPage" => $clientes->lastPage()
        ]);
    }

    /**
     * Página create
     *
     * @return Response
     */
    public function create(): ResponseInertia
    {
        return Inertia::render("Admin/Despachos/Create");
    }

    /**
     * Registrar un nuevo despacho
     *
     * @param DespachoStoreRequest $request
     * @return RedirectResponse|Response
     */
    public function store(DespachoStoreRequest $request): RedirectResponse|Response
    {
        DB::beginTransaction();
        try {
            // crear el Despacho
            $this->despachoService->crear($request->validated());
            DB::commit();
            return redirect()->route("despachos.index")->with("bien", "Registro realizado");
        } catch (\Exception $e) {
            DB::rollBack();
            throw ValidationException::withMessages([
                'error' =>  $e->getMessage(),
            ]);
        }
    }
}

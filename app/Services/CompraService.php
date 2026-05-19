<?php

namespace App\Services;

use App\Services\HistorialAccionService;
use App\Models\Compra;
use App\Models\User;
use Illuminate\Http\UploadedFile;
use Exception;
use Illuminate\Container\Attributes\Auth;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Validation\ValidationException;

class CompraService
{
    private $modulo = "CATEGORÍA DE PRODUCTOS";

    public function __construct(private  CargarArchivoService $cargarArchivoService, private HistorialAccionService $historialAccionService) {}

    public function listado(): Collection
    {
        $compras = Compra::select("compras.*")->get();
        return $compras;
    }
    /**
     * Lista de compras paginado con filtros
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
        $compras = Compra::select("compras.*");

        // Filtros exactos
        foreach ($columnsFilter as $key => $value) {
            if (!is_null($value)) {
                $compras->where("compras.$key", $value);
            }
        }

        // Filtros por rango
        foreach ($columnsBetweenFilter as $key => $value) {
            if (isset($value[0], $value[1])) {
                $compras->whereBetween("compras.$key", $value);
            }
        }

        // Búsqueda en múltiples columnas con LIKE
        if (!empty($search) && !empty($columnsSerachLike)) {
            $compras->where(function ($query) use ($search, $columnsSerachLike) {
                foreach ($columnsSerachLike as $col) {
                    $query->orWhere("$col", "LIKE", "%$search%");
                }
            });
        }

        // Ordenamiento
        foreach ($orderBy as $value) {
            if (isset($value[0], $value[1])) {
                $compras->orderBy($value[0], $value[1]);
            }
        }


        $compras = $compras->paginate($length, ['*'], 'page', $page);
        return $compras;
    }

    /**
     * Crear compra
     *
     * @param array $datos
     * @return Compra
     */
    public function crear(array $datos): Compra
    {
        $compra = Compra::create([
            "nombre" => $datos["nombre"],
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "CREACIÓN", "REGISTRO UNA CATEGORÍA DE PRODUCTO", $compra);

        return $compra;
    }

    /**
     * Actualizar compra
     *
     * @param array $datos
     * @param Compra $compra
     * @return Compra
     */
    public function actualizar(array $datos, Compra $compra): Compra
    {
        $old_compra = clone $compra;

        $compra->update([
            "nombre" => $datos["nombre"],
        ]);

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "MODIFICACIÓN", "ACTUALIZÓ UNA CATEGORÍA DE PRODUCTO", $old_compra, $compra->withoutRelations());

        return $compra;
    }

    /**
     * Eliminar compra
     *
     * @param Compra $compra
     * @return boolean
     */
    public function eliminar(Compra $compra): bool|Exception
    {
        // TODO: VERIFICAR RELACIONES

        $old_compra = clone $compra;
        $compra->delete();

        // registrar accion
        $this->historialAccionService->registrarAccion($this->modulo, "ELIMINACIÓN", "ELIMINÓ UNA CATEGORÍA DE PRODUCTO", $old_compra, $compra);

        return true;
    }
}

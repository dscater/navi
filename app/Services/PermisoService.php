<?php

namespace App\Services;

use App\Models\Permiso;
use App\Models\Role;
use Illuminate\Support\Facades\Auth;

class PermisoService
{
    protected $arrayPermisos = [
        "ADMINISTRADOR" => [
            "usuarios.paginado",
            "usuarios.index",
            "usuarios.listado",
            "usuarios.create",
            "usuarios.store",
            "usuarios.edit",
            "usuarios.show",
            "usuarios.update",
            "usuarios.destroy",
            "usuarios.password",
            "usuarios.byTipo",

            "tipo_usuarios.listado",
            "departamentos.listado",
            "provincias.listado",
            "ciudads.listado",

            "configuracions.index",
            "configuracions.create",
            "configuracions.edit",
            "configuracions.update",
            "configuracions.destroy",

            "segmentacion_zonas.paginado",
            "segmentacion_zonas.index",
            "segmentacion_zonas.listado",
            "segmentacion_zonas.listadoSegmentacion",
            "segmentacion_zonas.create",
            "segmentacion_zonas.store",
            "segmentacion_zonas.edit",
            "segmentacion_zonas.show",
            "segmentacion_zonas.update",
            "segmentacion_zonas.destroy",


            "reportes.usuarios",
            "reportes.r_usuarios",

        ],
        "GERENTE" => [],
        "SECRETARIA" => [],
    ];

    public function getTiposUsuarios()
    {
        return array_keys($this->arrayPermisos);
    }

    /**
     * Obtener permisos de usuario logeado
     *
     * @return array
     */
    public function getPermisosUser(): array|string
    {
        $user = Auth::user();
        $permisos = [];
        if ($user) {
            return $this->arrayPermisos[$user->tipo];
        }

        return $permisos;
    }
}

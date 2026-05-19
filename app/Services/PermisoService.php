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
            "usuarios.listadoAsignacions",
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

            "asignacion_zonas.paginado",
            "asignacion_zonas.index",
            "asignacion_zonas.listado",
            "asignacion_zonas.create",
            "asignacion_zonas.store",
            "asignacion_zonas.edit",
            "asignacion_zonas.show",
            "asignacion_zonas.update",
            "asignacion_zonas.destroy",

            "categoria_productos.paginado",
            "categoria_productos.index",
            "categoria_productos.listado",
            "categoria_productos.create",
            "categoria_productos.store",
            "categoria_productos.edit",
            "categoria_productos.show",
            "categoria_productos.update",
            "categoria_productos.destroy",

            "reportes.usuarios",
            "reportes.r_usuarios",

        ],
        "DISTRIBUIDOR" => [],
        "VENDEDOR" => [],
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

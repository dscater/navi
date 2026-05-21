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
            "usuarios.segmentacion_zonas_asignadas",

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

            "productos.paginado",
            "productos.index",
            "productos.listado",
            "productos.listadoStockBajo",
            "productos.create",
            "productos.store",
            "productos.edit",
            "productos.show",
            "productos.update",
            "productos.destroy",

            "presentacion_productos.paginado",
            "presentacion_productos.index",
            "presentacion_productos.listado",
            "presentacion_productos.create",
            "presentacion_productos.store",
            "presentacion_productos.edit",
            "presentacion_productos.show",
            "presentacion_productos.update",
            "presentacion_productos.destroy",

            "compras.paginado",
            "compras.index",
            "compras.listado",
            "compras.create",
            "compras.store",
            "compras.edit",
            "compras.show",
            "compras.update",
            "compras.destroy",

            "clientes.paginado",
            "clientes.index",
            "clientes.listado",
            "clientes.listadoSegmentacion",
            // "clientes.create",
            // "clientes.store",
            // "clientes.edit",
            "clientes.show",
            // "clientes.update",
            "clientes.destroy",

            "pedidos.paginado",
            "pedidos.index",
            "pedidos.listado",
            // "pedidos.create",
            // "pedidos.store",
            "pedidos.edit",
            "pedidos.show",
            "pedidos.update",
            "pedidos.destroy",
            "pedidos.pedidos_distruibidor",

            "despachos.paginado",
            "despachos.index",
            "despachos.listado",
            "despachos.create",
            "despachos.store",
            "despachos.edit",
            "despachos.show",
            "despachos.update",
            "despachos.destroy",

            "consolidados.paginado",
            "consolidados.index",
            "consolidados.listado",
            "consolidados.create",
            "consolidados.store",
            "consolidados.edit",
            "consolidados.show",
            "consolidados.update",
            "consolidados.destroy",

            "comisions.paginado",
            "comisions.index",
            "comisions.listado",
            "comisions.create",
            "comisions.store",
            "comisions.edit",
            "comisions.show",
            "comisions.update",
            "comisions.destroy",

            "reportes.usuarios",
            "reportes.r_usuarios",

        ],
        "DISTRIBUIDOR" => [
            "usuarios.segmentacion_zonas_asignadas",

            "productos.paginado",
            "productos.index",
            "productos.listado",
            "productos.listadoStockBajo",
            "productos.show",

            "presentacion_productos.index",
            "presentacion_productos.listado",

            "clientes.paginado",
            "clientes.index",
            "clientes.listado",
            "clientes.listadoSegmentacion",
            "clientes.create",
            "clientes.store",
            "clientes.edit",
            "clientes.show",
            "clientes.update",
            "clientes.destroy",

            "pedidos.paginado",
            "pedidos.index",
            "pedidos.listado",
            "pedidos.create",
            "pedidos.store",
            "pedidos.edit",
            "pedidos.show",
            "pedidos.update",
            "pedidos.destroy",
            "pedidos.pedidos_distruibidor",
            "pedidos.distribucion",

            "despachos.paginado",
            "despachos.index",
            "despachos.listado",
            "despachos.create",
            "despachos.store",
            "despachos.edit",
            "despachos.show",
            "despachos.update",
            "despachos.destroy",

            "consolidados.paginado",
            "consolidados.index",
            "consolidados.listado",
            "consolidados.create",
            "consolidados.store",
            "consolidados.edit",
            "consolidados.show",
            "consolidados.update",
            "consolidados.destroy",
        ],
        "VENDEDOR" => [
            "usuarios.segmentacion_zonas_asignadas",

            "productos.paginado",
            "productos.index",
            "productos.listado",
            "productos.listadoStockBajo",
            "productos.show",

            "presentacion_productos.index",
            "presentacion_productos.listado",

            "clientes.paginado",
            "clientes.index",
            "clientes.listado",
            "clientes.listadoSegmentacion",
            "clientes.create",
            "clientes.store",
            "clientes.edit",
            "clientes.show",
            "clientes.update",
            // "clientes.destroy",

            "pedidos.paginado",
            "pedidos.index",
            "pedidos.listado",
            "pedidos.create",
            "pedidos.store",
            "pedidos.edit",
            "pedidos.show",
            "pedidos.update",
            // "pedidos.destroy",
            "pedidos.pedidos_distruibidor",
            "pedidos.distribucion",

            "consolidados.paginado",
            "consolidados.index",
            "consolidados.listado",
            "consolidados.create",
            "consolidados.store",
            "consolidados.edit",
            "consolidados.show",
            "consolidados.update",
            "consolidados.destroy",
        ],
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

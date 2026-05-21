<?php

use App\Http\Controllers\AlertaEpidemiologicaController;
use App\Http\Controllers\AsignacionZonaController;
use App\Http\Controllers\CasoEpidemiologicoController;
use App\Http\Controllers\CategoriaEnfermedadController;
use App\Http\Controllers\CategoriaProductoController;
use App\Http\Controllers\CiudadController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ComisionController;
use App\Http\Controllers\CompraController;
use App\Http\Controllers\ComunidadController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\ConsolidadoController;
use App\Http\Controllers\DepartamentoController;
use App\Http\Controllers\DespachoController;
use App\Http\Controllers\EnfermedadController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\PacienteController;
use App\Http\Controllers\PedidoController;
use App\Http\Controllers\PresentacionProductoController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ProvinciaController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SegmentacionZonaController;
use App\Http\Controllers\SucursalController;
use App\Http\Controllers\TipoTransmisionController;
use App\Http\Controllers\TipoUsuarioController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UsuarioController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
});

Route::get('/login', function () {
    if (Auth::check()) {
        return redirect()->route('inicio');
    }
    return Inertia::render('Auth/Login');
})->name("login");

Route::get("configuracions/getConfiguracion", [ConfiguracionController::class, 'getConfiguracion'])->name("configuracions.getConfiguracion");

Route::get('/clear-cache', function () {
    Artisan::call('config:cache');
    Artisan::call('config:clear');
    Artisan::call('optimize');
    return 'Cache eliminado <a href="/">Ir al inicio</a>';
})->name('clear.cache');

Route::get("sincronizarInicio", [CertificadoEmitidoController::class, 'sincronizarInicio']);

// ADMINISTRACION
Route::middleware(['auth', 'permisoUsuario'])->prefix("admin")->group(function () {
    // INICIO
    Route::get('/inicio', [InicioController::class, 'inicio'])->name('inicio');
    Route::get('/certificadosEmitidosLinea', [InicioController::class, 'certificadosEmitidosLinea'])->name('certificadosEmitidosLinea');
    Route::get('/cantidadTramitesNormal', [InicioController::class, 'cantidadTramitesNormal'])->name('cantidadTramitesNormal');

    // CONFIGURACION
    Route::resource("configuracions", ConfiguracionController::class)->only(
        ["index", "show", "update"]
    );

    // USUARIO
    Route::get('profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::patch('profile/update_foto', [ProfileController::class, 'update_foto'])->name('profile.update_foto');
    Route::delete('profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get("getUser", [UserController::class, 'getUser'])->name('users.getUser');
    Route::get("permisosUsuario", [UserController::class, 'permisosUsuario']);

    // USUARIOS
    Route::put("usuarios/password/{user}", [UsuarioController::class, 'actualizaPassword'])->name("usuarios.password");
    Route::get("usuarios/paginado", [UsuarioController::class, 'paginado'])->name("usuarios.paginado");
    Route::get("usuarios/listado", [UsuarioController::class, 'listado'])->name("usuarios.listado");
    Route::get("usuarios/listadoAsignacions", [UsuarioController::class, 'listadoAsignacions'])->name("usuarios.listadoAsignacions");
    Route::get("usuarios/listado/byTipo", [UsuarioController::class, 'byTipo'])->name("usuarios.byTipo");
    Route::get("usuarios/segmentacion_zonas_asignadas", [UsuarioController::class, 'segmentacion_zonas_asignadas'])->name("usuarios.segmentacion_zonas_asignadas");
    Route::get("usuarios/show/{user}", [UsuarioController::class, 'show'])->name("usuarios.show");
    Route::put("usuarios/update/{user}", [UsuarioController::class, 'update'])->name("usuarios.update");
    Route::delete("usuarios/{user}", [UsuarioController::class, 'destroy'])->name("usuarios.destroy");
    Route::resource("usuarios", UsuarioController::class)->only(
        ["index", "store"]
    );

    // TIPO USUARIOS
    Route::get("tipo_usuarios/listado", [TipoUsuarioController::class, 'listado'])->name("tipo_usuarios.listado");

    // DEPARTAMENTOS
    Route::get("departamentos/listado", [DepartamentoController::class, 'listado'])->name("departamentos.listado");

    // PROVINCIAS
    Route::get("provincias/listado", [ProvinciaController::class, 'listado'])->name("provincias.listado");

    // CIUDADS
    Route::get("ciudads/listado", [CiudadController::class, 'listado'])->name("ciudads.listado");

    // SEGMENTACION ZONAS
    Route::get("segmentacion_zonas/paginado", [SegmentacionZonaController::class, 'paginado'])->name("segmentacion_zonas.paginado");
    Route::get("segmentacion_zonas/listado", [SegmentacionZonaController::class, 'listado'])->name("segmentacion_zonas.listado");
    Route::get("segmentacion_zonas/listadoSegmentacion", [SegmentacionZonaController::class, 'listadoSegmentacion'])->name("segmentacion_zonas.listadoSegmentacion");
    Route::resource("segmentacion_zonas", SegmentacionZonaController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // ASIGNACION ZONAS
    Route::get("asignacion_zonas/paginado", [AsignacionZonaController::class, 'paginado'])->name("asignacion_zonas.paginado");
    Route::get("asignacion_zonas/listado", [AsignacionZonaController::class, 'listado'])->name("asignacion_zonas.listado");
    Route::get("asignacion_zonas/listadoSegmentacion", [AsignacionZonaController::class, 'listadoSegmentacion'])->name("asignacion_zonas.listadoSegmentacion");
    Route::resource("asignacion_zonas", AsignacionZonaController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // CATEGORIA PRODUCTOS
    Route::get("categoria_productos/paginado", [CategoriaProductoController::class, 'paginado'])->name("categoria_productos.paginado");
    Route::get("categoria_productos/listado", [CategoriaProductoController::class, 'listado'])->name("categoria_productos.listado");
    Route::resource("categoria_productos", CategoriaProductoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // PRODUCTOS
    Route::get("productos/paginado", [ProductoController::class, 'paginado'])->name("productos.paginado");
    Route::get("productos/listado", [ProductoController::class, 'listado'])->name("productos.listado");
    Route::get("productos/listadoStockBajo", [ProductoController::class, 'listadoStockBajo'])->name("productos.listadoStockBajo");
    Route::resource("productos", ProductoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // PRESENTACION PRODUCTOS
    Route::get("presentacion_productos/paginado", [PresentacionProductoController::class, 'paginado'])->name("presentacion_productos.paginado");
    Route::get("presentacion_productos/listado", [PresentacionProductoController::class, 'listado'])->name("presentacion_productos.listado");
    Route::resource("presentacion_productos", PresentacionProductoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // COMPRAS
    Route::get("compras/paginado", [CompraController::class, 'paginado'])->name("compras.paginado");
    Route::get("compras/listado", [CompraController::class, 'listado'])->name("compras.listado");
    Route::resource("compras", CompraController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // CLIENTES
    Route::get("clientes/paginado", [ClienteController::class, 'paginado'])->name("clientes.paginado");
    Route::get("clientes/listado", [ClienteController::class, 'listado'])->name("clientes.listado");
    Route::get("clientes/listadoSegmentacion", [ClienteController::class, 'listadoSegmentacion'])->name("clientes.listadoSegmentacion");
    Route::resource("clientes", ClienteController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // PEDIDOS
    Route::get("pedidos/paginado", [PedidoController::class, 'paginado'])->name("pedidos.paginado");
    Route::get("pedidos/listado", [PedidoController::class, 'listado'])->name("pedidos.listado");
    Route::get("pedidos/distribucion", [PedidoController::class, 'distribucion'])->name("pedidos.distribucion");
    Route::get("pedidos/pedidos_distruibidor", [PedidoController::class, 'pedidos_distruibidor'])->name("pedidos.pedidos_distruibidor");
    Route::resource("pedidos", PedidoController::class)->only(
        ["index", "create", "store", "edit", "show", "update", "destroy"]
    );

    // DESPACHOS
    Route::get("despachos/paginado", [DespachoController::class, 'paginado'])->name("despachos.paginado");
    Route::get("despachos/listado", [DespachoController::class, 'listado'])->name("despachos.listado");
    Route::resource("despachos", DespachoController::class)->only(
        ["index", "create", "store", "edit", "show", "update", "destroy"]
    );

    // CONSOLIDADOS
    Route::get("consolidados/paginado", [ConsolidadoController::class, 'paginado'])->name("consolidados.paginado");
    Route::get("consolidados/listado", [ConsolidadoController::class, 'listado'])->name("consolidados.listado");
    Route::resource("consolidados", ConsolidadoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // COMISIONES
    Route::get("comisions/paginado", [ComisionController::class, 'paginado'])->name("comisions.paginado");
    Route::get("comisions/listado", [ComisionController::class, 'listado'])->name("comisions.listado");
    Route::resource("comisions", ComisionController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");
});
require __DIR__ . '/auth.php';

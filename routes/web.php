<?php

use App\Http\Controllers\AlertaEpidemiologicaController;
use App\Http\Controllers\AsignacionZonaController;
use App\Http\Controllers\CasoEpidemiologicoController;
use App\Http\Controllers\CategoriaEnfermedadController;
use App\Http\Controllers\CategoriaProductoController;
use App\Http\Controllers\CiudadController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ComunidadController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\DepartamentoController;
use App\Http\Controllers\EnfermedadController;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\PacienteController;
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
    Route::post("segmentacion_zonas/actualizaPermiso/{role}", [SegmentacionZonaController::class, 'actualizaPermiso'])->name("segmentacion_zonas.actualizaPermiso");
    Route::resource("segmentacion_zonas", SegmentacionZonaController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // ASIGNACION ZONAS
    Route::get("asignacion_zonas/paginado", [AsignacionZonaController::class, 'paginado'])->name("asignacion_zonas.paginado");
    Route::get("asignacion_zonas/listado", [AsignacionZonaController::class, 'listado'])->name("asignacion_zonas.listado");
    Route::get("asignacion_zonas/listadoSegmentacion", [AsignacionZonaController::class, 'listadoSegmentacion'])->name("asignacion_zonas.listadoSegmentacion");
    Route::post("asignacion_zonas/actualizaPermiso/{role}", [AsignacionZonaController::class, 'actualizaPermiso'])->name("asignacion_zonas.actualizaPermiso");
    Route::resource("asignacion_zonas", AsignacionZonaController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // CATEGORIA PRODUCTOS
    Route::get("categoria_productos/paginado", [CategoriaProductoController::class, 'paginado'])->name("categoria_productos.paginado");
    Route::get("categoria_productos/listado", [CategoriaProductoController::class, 'listado'])->name("categoria_productos.listado");
    Route::get("categoria_productos/listadoSegmentacion", [CategoriaProductoController::class, 'listadoSegmentacion'])->name("categoria_productos.listadoSegmentacion");
    Route::post("categoria_productos/actualizaPermiso/{role}", [CategoriaProductoController::class, 'actualizaPermiso'])->name("categoria_productos.actualizaPermiso");
    Route::resource("categoria_productos", CategoriaProductoController::class)->only(
        ["index", "store", "edit", "show", "update", "destroy"]
    );

    // REPORTES
    Route::get('reportes/usuarios', [ReporteController::class, 'usuarios'])->name("reportes.usuarios");
    Route::get('reportes/r_usuarios', [ReporteController::class, 'r_usuarios'])->name("reportes.r_usuarios");
});
require __DIR__ . '/auth.php';

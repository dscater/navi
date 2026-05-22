<?php

namespace App\Http\Controllers;

use App\Models\Certificado;
use App\Models\Cliente;
use App\Models\LoginUser;
use App\Models\Pedido;
use App\Models\User;
use App\Services\UserService;
use App\Services\PermisoService;
use App\Services\SegmentacionZonaService;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{



    protected $segmentacion_zona = null;
    public function __construct(private  UserService $userService)
    {
        $this->segmentacion_zona = $this->userService->getSegmentacionZona(Auth::user()->id);
    }

    public function permisosUsuario(Request $request)
    {
        $permisoService = new PermisoService();
        return response()->JSON([
            "permisos" => $permisoService->getPermisosUser()
        ]);
    }

    public function getUser()
    {
        return response()->JSON([
            "user" => Auth::user()
        ]);
    }

    public function getInfoBoxUser()
    {
        $permisos = [];
        $array_infos = [];
        if (Auth::check()) {
            $oUser = new User();
            $permisos = $oUser->permisos;
            if ($permisos == '*' || (is_array($permisos) && in_array('usuarios.index', $permisos))) {
                $array_infos[] = [
                    'label' => 'USUARIOS',
                    'cantidad' => User::where('id', '!=', 1)->count(),
                    'color' => 'bgWhite',
                    'icon' => "fa-users",
                    "url" => "usuarios.index"
                ];
            }
            if ($permisos == '*' || (is_array($permisos) && in_array('clientes.index', $permisos))) {
                $clientes = Cliente::where('status', 1);
                if (Auth::user()->tipo != 'ADMINISTRADOR') {
                    $clientes->where('segmentacion_zona_id', $this->segmentacion_zona?->id);
                }
                $clientes = $clientes->count();
                $array_infos[] = [
                    'label' => 'CLIENTES',
                    'cantidad' => $clientes,
                    'color' => 'bgWhite',
                    'icon' => "fa-user-friends",
                    "url" => "clientes.index"
                ];
            }

            if ($permisos == '*' || (is_array($permisos) && in_array('pedidos.index', $permisos))) {
                $pedidos = Pedido::where('status', 1);
                if (Auth::user()->tipo != 'ADMINISTRADOR') {
                    $pedidos->where('segmentacion_zona_id', $this->segmentacion_zona?->id);
                }
                $array_infos[] = [
                    'label' => 'PEDIDOS',
                    'cantidad' => $pedidos->count(),
                    'color' => 'bgWhite',
                    'icon' => "fa-clipboard-list",
                    "url" => "pedidos.index"
                ];
            }
        }


        return $array_infos;
    }
}

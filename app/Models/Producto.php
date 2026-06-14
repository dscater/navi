<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    protected $fillable = [
        "nombre",
        "descripcion",
        "categoria_producto_id",
        "stock_min",
        "stock_actual",
        "estado",
        "imagen",
    ];

    protected $appends = [
        "url_imagen",
        // "stock_disponible"
    ];

    public function getStockDisponibleAttribute()
    {
        $stock_actual = (float)$this->stock_actual;

        $c_pedidos_pendientes = PedidoDetalle::where("producto_id", $this->id)
            ->whereHas("pedido", function ($q) {
                $q->where("estado", "PENDIENTE");
                $q->where("status", 1);
            })->sum("cantidad_total");

        return (float)$stock_actual - (float)$c_pedidos_pendientes;
    }


    public function getUrlImagenAttribute()
    {
        if ($this->imagen) {
            return asset("imgs/productos/" . $this->imagen);
        }
        return asset("imgs/productos/default.png");
    }

    public function getImagenb64Attribute()
    {
        $path = public_path("imgs/productos/" . $this->imagen);
        if (!$this->imagen || !file_exists($path)) {
            $path = public_path("imgs/productos/default.png");
        }
        $type = pathinfo($path, PATHINFO_EXTENSION);
        $data = file_get_contents($path);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
        return $base64;
    }

    public function categoria_producto()
    {
        return $this->belongsTo(CategoriaProducto::class, 'categoria_producto_id');
    }

    public function presentacion_productos()
    {
        return $this->hasMany(PresentacionProducto::class, 'producto_id');
    }

    public function pedido_detalles()
    {
        return $this->hasMany(PedidoDetalle::class, 'producto_id');
    }
}

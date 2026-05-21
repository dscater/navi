<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pedido extends Model
{
    protected $fillable = [
        "user_id",
        "segmentacion_zona_id",
        "cliente_id",
        "despacho_id",
        "subtotal",
        "descuento",
        "total",
        "tipo_pago",
        "fecha",
        "hora",
        "observacion",
        "estado",
        "status",
    ];

    protected $appends = ["fecha_t"];

    public function getFechaTAttribute()
    {
        return date("d/m/Y", strtotime($this->fecha));
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function segmentacion_zona()
    {
        return $this->belongsTo(SegmentacionZona::class, 'segmentacion_zona_id');
    }

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    public function despacho()
    {
        return $this->belongsTo(Despacho::class, 'despacho_id');
    }

    public function pedido_detalles()
    {
        return $this->hasMany(PedidoDetalle::class, 'pedido_id');
    }
}

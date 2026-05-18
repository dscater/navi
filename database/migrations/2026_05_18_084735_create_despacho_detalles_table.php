<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('despacho_detalles', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("despacho_id");
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("pedido_detalle_id");
            $table->unsignedBigInteger("categoria_producto_id");
            $table->unsignedBigInteger("producto_id");
            $table->unsignedBigInteger("presentacion_producto_id");
            $table->unsignedBigInteger("venta_id")->nullable();
            $table->double("cantidad", 8, 2);
            $table->double("cantidad_despacho", 8, 2);
            $table->double("cantidad_entregado", 8, 2);
            $table->double("cantidad_devolucion", 8, 2)->nullable();
            $table->decimal("precio", 24, 2);
            $table->decimal("subtotal", 24, 2);
            $table->timestamps();

            $table->foreign("despacho_id")->on("despachos")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
            $table->foreign("pedido_detalle_id")->on("pedido_detalles")->references("id");
            $table->foreign("categoria_producto_id")->on("categoria_productos")->references("id");
            $table->foreign("producto_id")->on("productos")->references("id");
            $table->foreign("presentacion_producto_id")->on("presentacion_productos")->references("id");
            $table->foreign("venta_id")->on("ventas")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('despacho_detalles');
    }
};

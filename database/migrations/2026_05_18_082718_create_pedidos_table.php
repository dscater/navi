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
        Schema::create('pedidos', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("user_id");
            $table->unsignedBigInteger("cliente_id");
            $table->unsignedBigInteger("despacho_id")->nullable();
            $table->decimal("subtotal", 24, 2);
            $table->decimal("descuento", 24, 2);
            $table->decimal("total", 24, 2);
            $table->date("fecha");
            $table->time("hora");
            $table->text("observacion")->nullable();
            $table->string("estado")->default("PENDIENTE"); // PENDIENTE, ENTREGADO
            $table->integer("status")->default(1);
            $table->timestamps();

            $table->foreign("user_id")->on("users")->references("id");
            $table->foreign("cliente_id")->on("clientes")->references("id");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pedidos');
    }
};

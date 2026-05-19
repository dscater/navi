<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class PresentacionProductoStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "producto_id" => "required",
            "nombre" => "required",
            "equivale" => "required",
            "precio" => "required",
            "comi_distribuidor" => "required",
            "comi_vendedor" => "required",
        ];
    }

    public function messages()
    {
        return [
            "producto_id.required" => "Debes completar este campo",
            "nombre.required" => "Debes completar este campo",
            "nombre.unique" => "Este nombre no esta disponible",
            "equivale.required" => "Debes completar este campo",
            "precio.required" => "Debes completar este campo",
            "comi_distribuidor.required" => "Debes completar este campo",
            "comi_vendedor.required" => "Debes completar este campo",
        ];
    }
}

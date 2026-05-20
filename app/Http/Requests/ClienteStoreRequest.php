<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class ClienteStoreRequest extends FormRequest
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
            "nombre" => "required|unique:clientes,nombre",
            "fono" => "required",
            "razon_social" => "nullable",
            "nit_ci" => "nullable",
            "dir" => "required",
            "latitud" => "required",
            "longitud" => "required",
        ];
    }

    public function messages()
    {
        return [
            "nombre.required" => "Debes completar este campo",
            "nombre.unique" => "Este nombre no esta disponible",
            "fono.required" => "Debes completar este campo",
            "razon_social.required" => "Debes completar este campo",
            "nit_ci.required" => "Debes completar este campo",
            "dir.required" => "Debes completar este campo",
            "latitud.required" => "Debes completar este campo",
            "longitud.required" => "Debes completar este campo",

        ];
    }
}

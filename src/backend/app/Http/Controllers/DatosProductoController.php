<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Producto;

class DatosProductoController extends Controller
{
    //
    public function index()
    {
        //
       
        $productos = Producto::select(
            'producto.idProducto',
            'producto.nombre',
            'descripcion',
            'precioVenta',
            'producto.estado',
            'imagenproducto.idImagen',
            'ruta',
            'imagenProducto.nombre as nombre_imagen',
            'tipoProducto.nombre as nombre_tipo_producto',
            'marca.nombre as nombre_marca'
        )
        ->join('ImagenProducto', 'producto.idProducto', '=', 'imagenProducto.idProducto')
        ->join('Marca', 'marca.idMarca', '=', 'producto.idMarca')
        ->join('TipoProducto', 'tipoProducto.idTipoProducto', '=', 'producto.idTipoProducto')
        ->get();
    
       
        return response()->json($productos, 200);
    }
}

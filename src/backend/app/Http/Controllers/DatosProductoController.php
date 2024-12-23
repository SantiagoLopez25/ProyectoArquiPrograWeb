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
            'imagenproducto.nombre as nombre_imagen',
            'tipoproducto.nombre as nombre_tipo_producto',
            'marca.nombre as nombre_marca'
        )
        ->join('imagenproducto', 'producto.idProducto', '=', 'imagenproducto.idProducto')
        ->join('marca', 'marca.idMarca', '=', 'producto.idMarca')
        ->join('tipoproducto', 'tipoproducto.idTipoProducto', '=', 'producto.idTipoProducto')
        ->where('producto.estado', 1) 
        ->orderBy('producto.idProducto', 'asc')
        ->get();
    
       
        return response()->json($productos, 200);
    }

    public function show(string $id)
    {
        $rps = Producto::find($id);
        return response()->json($rps, 200);
    }
}

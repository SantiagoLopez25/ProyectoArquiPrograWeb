<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sucursal;
use App\Models\RProductoSucursal;


class InventarioController extends Controller
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

    public function getInventario(string $idSucursal)
    {

        $inventario = Sucursal::select(
            'producto.idProducto',
            'producto.nombre',
            'imagenproducto.ruta',
            'marca.nombre as nombre_marca',
            'r.cantidad',
            'sucursal.nombre as nombre_sucursal'
        )
        ->join('rproductosucursal as r', 'sucursal.idSucursal', '=', 'r.idSucursal')
        ->join('producto', 'producto.idProducto', '=', 'r.idProducto')
        ->join('imagenproducto', 'producto.idProducto', '=', 'imagenproducto.idProducto')
        ->join('marca', 'producto.idMarca', '=', 'marca.idMarca')
        ->where('sucursal.idSucursal', $idSucursal)
        ->orderBy('producto.idProducto')
        ->get();

        return response()->json($inventario, 200);
    }

    public function putTraslado(Request $request){
        try{
            $request->validate([
                'idSucursalDonante' => 'required|int',
                'idSucursalBeneficiada' => 'required|int',
                'idProducto' => 'required|int',
                'cantidad' => 'required|int',
            ]);
        
            $idProducto = $request->idProducto;
            $cantidad = $request->cantidad;
        
            // Actualizar la cantidad en la sucursal donante
            $donante = RProductoSucursal::where('idSucursal', $request->idSucursalDonante)
                ->where('idProducto', $idProducto)
                ->firstOrFail();
        
            if ($donante->cantidad < $cantidad) {
                return response()->json([
                    'error' => 'Cantidad insuficiente en la sucursal donante.'
                ], 400);
            }
        
            $donante->cantidad -= $cantidad;
            $donante->save();
        
            // Actualizar la cantidad en la sucursal beneficiada
            $beneficiada = RProductoSucursal::where('idSucursal', $request->idSucursalBeneficiada)
                ->where('idProducto', $idProducto)
                ->firstOrFail();
        
            $beneficiada->cantidad += $cantidad;
            $beneficiada->save();
        
            return response()->json(['message' => 'Traslado completado correctamnte',]);
        }
        catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
           
        }
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Producto;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $productos = Producto::all();
       
        return response()->json($productos, 200);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        try {
            $request->validate([
                'nombre' => 'required|string|max:50',
                'descripcion' => 'required|string|max:500',
                'precioVenta' => 'decimal|min:0|max:9999999999.99',
                'estado' => 'required|boolean',
                'idTipoProducto' => 'required|exists:Producto,idTipoProducto',
                'idMarca' => 'required|exists:Marca,idMarca'
            ]);
    
            $productos = Producto::create($request->all());
           // return response()->json($clientes, 201);
            return 1;


        }

        catch (\Ecception $e) {
           // return response()->json(['Error' => $e], 500);
           return 0;
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
        $productos = Producto::find($id);
         return response()->json($productos, 200);
        //return 1;
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
        try{
            $request->validate([
               'nombre' => 'required|string|max:50',
                'descripcion' => 'required|string|max:500',
                'precioVenta' => 'decimal|min:0|max:9999999999.99',
                'estado' => 'required|boolean',
                'idTipoProducto' => 'required|exists:Producto,idTipoProducto',
                'idMarca' => 'required|exists:Marca,idMarca'
            ]);
    
            $productos = Producto::findOrFail($id); 
    
            $productos->update($request->all());
            //return response()->json($clientes, 200);
            return 1;
        }
        catch (\Exception $e) {
            //return response()->json(['error' => $e], 500);
            return 0;
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}

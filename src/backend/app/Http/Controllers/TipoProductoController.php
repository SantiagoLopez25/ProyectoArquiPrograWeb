<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TipoProducto;

class TipoProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $tipoP = TipoProducto::select(
            'idTipoProducto',
            'nombre'
        )
        ->where('estado',1)
        ->get();
       
        return response()->json($tipoP, 200);
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
                'estado' => 'required|boolean'
            ]);
    
            $tipoP = TipoProducto::create($request->all());
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
        $tipoP = TipoProducto::find($id);
        return response()->json($tipoP, 200);
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
                'estado' => 'required|boolean'
            ]);
    
            $tipoP = TipoProducto::findOrFail($id); 
    
            $tipoP->update($request->all());
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

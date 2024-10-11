<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RProductoSucursal;

class RPSController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $rps = RProductoSucursal::all();
       
        return response()->json($rps, 200);
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
               'cantidad' => 'required|integer',
                'idProducto' => 'required|exists:Producto|idProducto',
                'idSucursal' => 'required|exists:Sucursal|idSucursal'
            ]);
    
            $rps = RProductoSucursal::create($request->all());
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
        $rps = RProductoSucursal::find($id);
        return response()->json($rps, 200);
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
                'cantidad' => 'required|integer',
                'idProducto' => 'required|exists:Producto|idProducto',
                'idSucursal' => 'required|exists:Sucursal|idSucursal'
            ]);
    
            $rps = RProductoSucursal::findOrFail($id); 
    
            $rps->update($request->all());
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

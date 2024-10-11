<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Factura;

class FacturaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $facturas = Factura::all();
       
        return response()->json($facturas, 200);
        
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
                'fechaFactura' => 'required|date',
                'montoTotal' => 'required|min:0|max:9999999999999999.99',
                'idCliente' => 'required|exists:Cliente,idCliente',
                'idSerie' => 'required|exists:SerieFactura|idSerie'
            ]);
    
            $facturas = Factura::create($request->all());
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
        $facturas = Factura::find($id);
         return response()->json($facturas, 200);
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
                'fechaFactura' => 'required|date',
                'montoTotal' => 'required|min:0|max:9999999999999999.99',
                'idCliente' => 'required|exists:Cliente,idCliente',
                'idSerie' => 'required|exists:SerieFactura|idSerie'
            ]);
    
            $facturas = Factura::findOrFail($id); 
    
            $facturas->update($request->all());
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

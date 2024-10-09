<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
        $clientes = Cliente::all();
       
        return response()->json($clientes, 200);
        //return csrf_token();
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
                'nombre' => 'required|string|max:75',
                'direccion' => 'required|string|max:100',
                'estado' => 'required|boolean'
            ]);
    
            $clientes = Cliente::create($request->all());
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
        $cliente = Cliente::find($id);
       // return response()->json($cliente, 200);
       return 1;
        
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
                'nombre' => 'required|string|max:75',
                'direccion' => 'required|string|max:100',
                'estado' => 'required|boolean'
            ]);
    
            $clientes = Cliente::findOrFail($id); 
    
            $clientes->update($request->all());
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
       /* $clientes = Cliente::findOrFail($id); //Si no lo encuentra devuelve un error 404

        $clientes->delete();
        return response()->json('El cliente ha sido eliminado', 200);*/
    }
}

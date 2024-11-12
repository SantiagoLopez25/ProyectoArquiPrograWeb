<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;
use App\Models\Contacto;
use Illuminate\Support\Facades\DB;

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
        $request->validate([
            'nombre' => 'required|string|max:75',
            'direccion' => 'required|string|max:100',
            'estado' => 'required|boolean',
            'telefono' => 'required|string|max:8',
            'email' => 'required|string|max:75'
        ]);

        DB::beginTransaction();
        try {
            //crear un cliente nuevo
            $cliente = Cliente::create([
                'nombre' => $request->nombre,
                'direccion' => $request->direccion,
                'estado' => $request->estado,
            ]);

            //crear el contacto asociado al cliente nuevo
            Contacto::create([
                'telefono' => $request->telefono,
                'email' => $request->email,
                'idCliente' => $cliente->idCliente
            ]);

            DB::commit();
            return response()->json(['mensaje' => 'Cliente creado exitosamente'], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => 'Error al crear cliente', 'error:' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
        $cliente = Cliente::find($id);
       return response()->json($cliente, 200);
       
        
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

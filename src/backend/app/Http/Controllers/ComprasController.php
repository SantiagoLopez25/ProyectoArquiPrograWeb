<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Compras;
use App\Models\RProductoSucursal;
use App\Models\Sucursal;

class ComprasController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $compras = Compras::where('estado', 1)->get();
        return response()->json($compras, 200);
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
        try {
            $request->validate([
                'cantidad' => 'required|integer',
                'fecha' => 'required|date'
            ]);
    
            $rps = Compras::create($request->all());
            return 1;
        } catch (\Exception $e) {
            return response()->json(['error' => $e], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
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
        DB::beginTransaction();
        try {
            $cantidad = $request->input("cantidad");
            $db_compra = Compras::where('idCompra', $id)->first();

            if ($db_compra) {
                $idProductoSucursal = $db_compra->idProductoSucursal;
                $cantidad = $db_compra->cantidad;

                $productoActual = RProductoSucursal::where('idProductoSucursal', $idProductoSucursal)->first();
                $total = intval($productoActual->cantidad) + $cantidad;

                Compras::where('idCompra', $id)->update([
                    'cantidad' => 0,
                    'estado' => false
                ]);

                RProductoSucursal::where('idProductoSucursal', $idProductoSucursal)->update([
                    'cantidad' => $total
                ]);
            }
            //$json_compra = response()->json($db_compra, 200);
            
            DB::commit();
            return "ID: $id -> ok";
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['error' => $e], 500);
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

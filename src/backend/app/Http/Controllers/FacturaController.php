<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Factura;
use Illuminate\Support\Facades\DB;
use App\Models\Cliente;
use App\Models\Contacto;
use App\Models\DetalleFactura;
use App\Models\RProductoSucursal;

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
     * Realizar Venta
     */
    public function store(Request $request)
    {
        
        DB::beginTransaction();

        try {
            $datos = $request->input('datos');
            $detalleFactura = $request->input('detalleFactura');

            $montoTotal = $datos['montoTotal'] ?? null;
            $idSucursal = $datos['idSucursal'] ?? null;
            $nombreCliente = $datos['nombreCliente'] ?? null;
            $direccion = $datos['direccion'] ?? null;
            $correo = $datos['correo'] ?? null;
            $serie = 'A-01';

            // Validar el detalle de la factura
            if (empty($detalleFactura) || count($detalleFactura) === 0) {
                return response()->json(['mensaje' => 'No se asignaron productos a la venta'], 400);
            }

            // Verificar si existe el cliente
            $clienteExistente = Cliente::join('contacto', 'cliente.idCliente', '=', 'contacto.idCliente')
            ->where('contacto.email', $correo)
            ->select('cliente.idCliente')
            ->first();
            

            if ($clienteExistente) {
                $idCliente = $clienteExistente->idCliente;
            } else {
                // Insertar cliente
                $cliente = Cliente::create([
                    'nombre' => $nombreCliente,
                    'direccion' => $direccion,
                    'estado' => 1
                ]);
                $idCliente = $cliente->idCliente;
            }

            // Insertar factura
            $factura = Factura::create([
                'fechaFactura' => now(),
                'montoTotal' => $montoTotal,
                'idCliente' => $idCliente,
                'idSerie' => $serie,
                'idSucursal' => $idSucursal
            ]);

            // Procesar cada producto en el detalleFactura
            foreach ($detalleFactura as $detalle) {
                $idProducto = $detalle['idProducto'];
                $cantidad = $detalle['cantidad'];

                // Verificar stock en la sucursal
                $productoSucursal = RProductoSucursal::where('idSucursal', $idSucursal)
                    ->where('idProducto', $idProducto)
                    ->first();

                if (!$productoSucursal || $productoSucursal->cantidad < $cantidad) {
                    // Buscar en otra sucursal si no hay suficiente stock
                    $otraSucursal = RProductoSucursal::where('idProducto', $idProducto)
                        ->where('cantidad', '>=', $cantidad)
                        ->orderBy('cantidad', 'desc')
                        ->first();

                    if (!$otraSucursal) {
                        DB::rollBack();
                        return response()->json(['mensaje' => "Existencias insuficientes para el producto con ID: $idProducto"], 400);
                    }

                    // Actualizar stock en la otra sucursal y registrar en detalleFactura
                    $otraSucursal->cantidad -= $cantidad;
                    $otraSucursal->save();

                    DetalleFactura::create([
                        'cantidad' => $cantidad,
                        'idFactura' => $factura->idFactura,
                        'idSerie' => $serie,
                        'idProducto' => $idProducto
                    ]);
                } else {
                    // Actualizar stock en la sucursal actual y registrar en detalleFactura
                    $productoSucursal->cantidad -= $cantidad;
                    $productoSucursal->save();

                    DetalleFactura::create([
                        'cantidad' => $cantidad,
                        'idFactura' => $factura->idFactura,
                        'idSerie' => $serie,
                        'idProducto' => $idProducto
                    ]);
                }
            }

            DB::commit();
            return response()->json(['mensaje' => 'Venta realizada correctamente'], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['mensaje' => 'Error en la transacción: ' . $e->getMessage()], 500);
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

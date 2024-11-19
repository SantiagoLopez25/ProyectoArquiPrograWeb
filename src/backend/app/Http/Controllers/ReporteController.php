<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReporteController extends Controller
{
        //reporte Top 100 productos más vendidos por sucursal
        public function topProductosPorSucursal(Request $request)
        {
            //validacion de que el idSucursal sea recibido correctamente
            $request->validate([
                'idSucursal' => 'required|integer'
            ]);
    
            $idSucursal = $request->input('idSucursal');
    
            //Consulta SQL
            $productos = DB::table('detallefactura as df')
                ->join('producto as p', 'df.idProducto', '=', 'p.idProducto')
                ->join('factura as f', 'df.idFactura', '=', 'f.idFactura')
                ->join('sucursal as s', 'f.idSucursal', '=', 's.idSucursal')
                ->select('s.nombre as Sucursal', 'p.nombre as Producto', DB::raw('SUM(df.cantidad) as Cantidad_Total'))
                ->where('s.idSucursal', $idSucursal)
                ->groupBy('s.nombre', 'p.nombre', 's.idSucursal', 'p.idProducto')
                ->orderByDesc('cantidad_total')
                ->limit(100)
                ->get();
    
            //respuesta
            return response()->json($productos);
        }
    
        //reporte Top 100 productos más vendidos en general
        public function topProductosGeneral()
        {
            $productos = DB::table('detallefactura as df')
            ->join('producto as p', 'df.idProducto', '=', 'p.idProducto')
            ->join('factura as f', 'df.idFactura', '=', 'f.idFactura')
            ->join('sucursal as s', 'f.idSucursal', '=', 's.idSucursal')
            ->select('s.nombre as Sucursal', 'p.nombre as Producto', DB::raw('SUM(df.cantidad) as Cantidad_total'))
            ->groupBy('s.nombre', 'p.nombre', 's.idSucursal', 'p.idProducto')
            ->orderByDesc('cantidad_total')
            ->limit(100)
            ->get();

        return response()->json($productos);
        }

        public function productosConBajaExistencia(Request $request)
        {
        //validacion que el ID de la sucursal sea enviadp
            $request->validate([
            'idSucursal' => 'required|integer'
        ]);

        $idSucursal = $request->input('idSucursal');

        try {
            //Consulta a la base de datos
            $productos = DB::table('rproductosucursal as ps')
            ->join('producto as p', 'ps.idProducto', '=', 'p.idProducto')
            ->join('sucursal as s', 'ps.idSucursal', '=', 's.idSucursal')
            ->select('s.nombre as Sucursal', 'p.nombre as Producto', 'ps.cantidad as Existencia')
            ->where('ps.cantidad', '<', 10)
            ->where('s.idSucursal', $idSucursal)
            ->orderBy('ps.cantidad', 'asc')
            ->limit(20)
            ->get();

            //respuesta en JSON
            return response()->json($productos);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function productosMasVendidosPorMesG(Request $request)
    {
        //validacion que el mes sea proporcionado y válido
        $request->validate([
            'mes' => 'required|integer|between:1,12'
        ]);
    
        $mes = $request->input('mes');
    
        try {
            //Consulta a la base de datos
            $productos = DB::table('detallefactura as df')
                ->join('producto as p', 'df.idProducto', '=', 'p.idProducto')
                ->join('factura as f', 'df.idFactura', '=', 'f.idFactura')
                ->select(
                    DB::raw('MONTHNAME(f.fechaFactura) as Mes'),
                    'p.nombre as Producto',
                    DB::raw('SUM(df.cantidad) as Cantidad_Total')
                )
                ->whereRaw('MONTH(f.fechaFactura) = ?', [$mes])
                ->groupBy('mes', 'p.idProducto')
                ->orderByDesc('cantidad_total')
                ->limit(100)
                ->get();
    
            //respuesta en JSON
            return response()->json($productos);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    public function productosMasVendidosPorMesYSucursal(Request $request)
    {
        //validar que el ID de la sucursal y el mes sean proporcionados
        $request->validate([
            'idSucursal' => 'required|integer',
            'mes' => 'required|integer|between:1,12'
        ]);
    
        $idSucursal = $request->input('idSucursal');
        $mes = $request->input('mes');
    
        try {
            //Consulta para obtener productos más vendidos por sucursal
            $productos = DB::table('detallefactura as df')
                ->join('producto as p', 'df.idProducto', '=', 'p.idProducto')
                ->join('factura as f', 'df.idFactura', '=', 'f.idFactura')
                ->join('sucursal as s', 'f.idSucursal', '=', 's.idSucursal')
                ->select(
                    DB::raw('MONTHNAME(f.fechaFactura) as Mes'),
                    's.nombre as Sucursal',
                    'p.nombre as Producto',
                    DB::raw('SUM(df.cantidad) as Cantidad_Total')
                )
                ->where('s.idSucursal', $idSucursal)
                ->whereRaw('MONTH(f.fechaFactura) = ?', [$mes])
                ->groupBy('s.idSucursal', 'mes', 'p.idProducto')
                ->orderByDesc('cantidad_total')
                ->limit(100)
                ->get();
    
            //retornar datos en JSON
            return response()->json($productos);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    public function productosMasVendidosPorMesGeneral(Request $request)
    {
        //validar que el mes sea proporcionado
        $request->validate([
            'mes' => 'required|integer|between:1,12'
        ]);
    
        $mes = $request->input('mes');
    
        try {
            //Consulta para obtener productos más vendidos de forma general
            $productos = DB::table('detallefactura as df')
                ->join('producto as p', 'df.idProducto', '=', 'p.idProducto')
                ->join('factura as f', 'df.idFactura', '=', 'f.idFactura')
                ->select(
                    DB::raw('MONTHNAME(f.fechaFactura) as Mes'),
                    'p.nombre as Producto',
                    DB::raw('SUM(df.cantidad) as Cantidad_Total')
                )
                ->whereRaw('MONTH(f.fechaFactura) = ?', [$mes])
                ->groupBy('mes', 'p.idProducto')
                ->orderByDesc('cantidad_total')
                ->limit(100)
                ->get();
    
            //datos en JSON
            return response()->json($productos);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    public function clientesFrecuentesPorSucursal(Request $request)
    {
        //validar que el ID de la sucursal sea proporcionado
        $request->validate([
            'idSucursal' => 'required|integer',
        ]);
    
        $idSucursal = $request->input('idSucursal');
    
        try {
            //Consulta para obtener los clientes frecuentes por sucursal
            $clientes = DB::table('factura as f')
                ->join('cliente as c', 'f.idCliente', '=', 'c.idCliente')
                ->join('sucursal as s', 'f.idSucursal', '=', 's.idSucursal')
                ->select(
                    's.nombre as Sucursal',
                    'c.nombre as Cliente',
                    DB::raw('COUNT(f.idFactura) as Compras_Realizadas')
                )
                ->where('s.idSucursal', $idSucursal)
                ->groupBy('s.idSucursal', 'c.idCliente')
                ->having('compras_realizadas', '>', 1)
                ->orderByDesc('compras_realizadas')
                ->get();
    
            //respuesta de los datos en formato JSON
            return response()->json($clientes);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    public function clientesFrecuentesGeneral()
    {
        try {
            //consulta para obtener los clientes frecuentes de forma general
            $clientes = DB::table('factura as f')
                ->join('cliente as c', 'f.idCliente', '=', 'c.idCliente')
                ->select(
                    'c.nombre as Cliente',
                    DB::raw('COUNT(f.idFactura) as Compras_Realizadas')
                )
                ->groupBy('c.idCliente')
                ->having('compras_realizadas', '>', 1)
                ->orderByDesc('compras_realizadas')
                ->get();
    
            //datos en formato JSON
            return response()->json($clientes);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }    
}

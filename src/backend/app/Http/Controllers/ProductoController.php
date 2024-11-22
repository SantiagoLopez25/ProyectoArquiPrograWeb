<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Producto;
use App\Models\ImagenProducto;
use App\Models\RProductoSucursal;
use Illuminate\Support\Facades\DB;

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
      
            $request->validate([
                'nombreProducto' => 'required|string|max:50',
                'descripcion' => 'required|string|max:500',
                'precioVenta' => 'min:0|max:9999999999.99',
                'imagen' => 'required|string|max:1000',
                'idTipoProducto' => 'required',
                'idMarca' => 'required'
            ]);


            DB::beginTransaction();
            try {

                //crear una imagen nueva
                $producto = Producto::create([
                    'nombre' => $request->nombreProducto,
                    'descripcion' => $request->descripcion,
                    'precioVenta' => $request->precioVenta,
                    'estado' => 1,
                    'idTipoProducto' => $request->idTipoProducto,
                    'idMarca' => $request->idMarca
                    

                ]);

                //crear una imagen nueva
                ImagenProducto::create([
                    'ruta' => $request->imagen,
                    'nombre' => $request->nombreProducto . ' imagen',
                    'estado' => 1,
                    'idProducto' => $producto->idProducto
                ]);

                for($i = 0; $i<6;$i++){
                    RProductoSucursal::create([
                        'idSucursal' => $i+1,
                        'cantidad' => 0,
                        'idProducto' => $producto->idProducto
                    ]);
                }
    
               
    
                DB::commit();
                return response()->json(['mensaje' => 'Producto creado exitosamente'], 201);
    
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['error' => 'Error al crear el producto', 'error:' => $e->getMessage()], 500);
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
                'nombre' => 'sometimes|string|max:50',
                'descripcion' => 'sometimes|string|max:500',
                'precioVenta' => 'sometimes|min:0|max:9999999999.99',
                'estado' => 'sometimes|boolean',
                'idTipoProducto' => 'sometimes',
                'idMarca' => 'sometimes',
                'ruta' => 'sometimes|string'
            ]);
    
            $productos = Producto::findOrFail($id); 
    
            $productos->update($request->all());

            
            $imagen = ImagenProducto::where('idProducto', $id)->first();

            $imagen->update($request->all());
               
            
           
            return response()->json(['mensaje' => 'Acción completada  exitosamente'], 201);
        }
        catch (\Exception $e) {
            //return response()->json(['error' => $e], 500);
            return response()->json(['error' => 'Error al crear el producto', 'error:' => $e->getMessage()], 500);
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

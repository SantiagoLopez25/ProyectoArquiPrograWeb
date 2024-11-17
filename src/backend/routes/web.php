<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\ContactoController;
use App\Http\Controllers\DatosProductoController;
use App\Http\Controllers\DetalleFacturaController;
use App\Http\Controllers\EmpleadoController;
use App\Http\Controllers\FacturaController;
use App\Http\Controllers\HistorialController;
use App\Http\Controllers\ImagenProductoController;
use App\Http\Controllers\MarcaController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\RolController;
use App\Http\Controllers\RPSController;
use App\Http\Controllers\SerieFacturaController;
use App\Http\Controllers\SucursalController;
use App\Http\Controllers\TipoProductoController;
use App\Http\Controllers\UsuarioController;

Route::get('/', function () {
    return view('welcome');
});

Route::resource('clientes', ClienteController::class);
Route::resource('contactos', ContactoController::class);
Route::resource('datosproductos', DatosProductoController::class);
Route::resource('detalles', DetalleFacturaController::class);
Route::resource('empleados', EmpleadoController::class);
Route::resource('facturas', FacturaController::class);
Route::resource('historiales', HistorialController::class);
Route::resource('imagenes', ImagenProductoController::class);
Route::resource('marcas', MarcaController::class);
Route::resource('productos', ProductoController::class);
Route::resource('roles', RolController::class);
Route::resource('rps', RPSController::class);
Route::resource('series', SerieFacturaController::class);
Route::resource('sucursales', SucursalController::class);
Route::resource('tiposp', TipoProductoController::class);
Route::resource('usuarios', UsuarioController::class);

Route::get('/api/usuarios/{user}', [UsuarioController::class, 'fecthUser']);
Route::post('/api/cliente-contacto', [ClienteController::class, 'store']);




<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Producto extends Model
{
    use HasFactory;
    protected $table = 'Producto';  
    protected $primaryKey = 'idProducto';  

    protected $fillable = [
        'nombre',
        'descripcion',
        'precioVenta',
        'estado',
        'idTipoProducto',
        'idMarca'
    ];

    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detalleFactura extends Model
{
    use HasFactory;
    protected $table = 'DetalleFactura';  
    protected $primaryKey = 'idDetalleFactura';  

    protected $fillable = [
        'telefono',
        'cantidad',
        'idFactura',
        'idSerie',
        'idProducto'
    ];

    public $timestamps = false;
}

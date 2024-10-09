<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RProductoSucursal extends Model
{
    use HasFactory;
    protected $table = 'RProductoSucursal';  
    protected $primaryKey = 'idProductoSucursal';  

    protected $fillable = [
        'cantidad',
        'idProducto',
        'idSucursal'
    ];

    public $timestamps = false;
}
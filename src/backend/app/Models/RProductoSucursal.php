<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RProductoSucursal extends Model
{
    use HasFactory;
    protected $table = 'rproductosucursal';  
    protected $primaryKey = 'idProductoSucursal';  

    protected $fillable = [
        'cantidad',
        'idProducto',
        'idSucursal'
    ];

    public $timestamps = false;

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'idProducto');
    }

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'idSucursal');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Compras extends Model
{
    use HasFactory;

    protected $table = 'compra';  
    protected $primaryKey = 'idCompra';  

    protected $fillable = [
        'idProductoSucursal',
        'cantidad',
        'fecha',
        'estado'
    ];

    public $timestamps = false;

    public function getIdProductoSucursal()
    {
        return $this->belongsTo(Factura::class, 'idProductoSucursal');
    }
}

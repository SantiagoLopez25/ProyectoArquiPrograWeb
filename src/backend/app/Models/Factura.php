<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    use HasFactory;
    protected $table = 'Factura';  
    protected $primaryKey = 'idFactura';  

    protected $fillable = [
        'fechaFactura',
        'montoTotal',
        'idCliente',
        'idSerie'
    ];

    public $timestamps = false;
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Factura extends Model
{
    use HasFactory;
    protected $table = 'factura';  
    protected $primaryKey = 'idFactura';  

    protected $fillable = [
        'fechaFactura',
        'montoTotal',
        'idCliente',
        'idSerie'
    ];

    public $timestamps = false;

    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'idCliente');
    }

    public function serieFactura()
    {
        return $this->belongsTo(SerieFactura::class, 'idSerie');
    }

   


}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class detalleFactura extends Model
{
    use HasFactory;
    protected $table = 'detalleFactura';  
    protected $primaryKey = 'idDetalleFactura';  

    protected $fillable = [
        'cantidad',
        'idFactura',
        'idSerie',
        'idProducto'
    ];

    public $timestamps = false;


    public function factura()
    {
        return $this->belongsTo(Factura::class, 'idFactura');
    }

    public function serieFactura()
    {
        return $this->belongsTo(SerieFactura::class, 'idSerie');
    }
    
    public function producto()
    {
        return $this->belongsTo(Producto::class, 'idProducto');
    }
}

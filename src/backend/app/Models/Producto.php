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

    public function tipoProducto()
    {
        return $this->belongsTo(TipoProducto::class, 'tipoProducto');
    }

    public function marca()
    {
        return $this->belongsTo(Marca::class, 'idMarca');
    }
}

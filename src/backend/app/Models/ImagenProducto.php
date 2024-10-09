<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ImagenProducto extends Model
{
    use HasFactory;
    protected $table = 'ImagenProducto';  
    protected $primaryKey = 'idImagen';  

    protected $fillable = [
        'ruta',
        'nombre',
        'idProducto'
    ];

    public $timestamps = false;

    public function producto()
    {
        return $this->belongsTo(Producto::class, 'idProducto');
    }
}

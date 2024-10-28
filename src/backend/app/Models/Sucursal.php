<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sucursal extends Model
{
    use HasFactory;
    protected $table = 'sucursal';  
    protected $primaryKey = 'idSucursal';  

    protected $fillable = [
        'nombre',
        'ubicacion',
        'telefono',
        'celurar',
        'email',
        'estado',
        'direccion'
    ];

    public $timestamps = false;
}

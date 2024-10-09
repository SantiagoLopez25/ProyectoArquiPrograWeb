<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Usuario extends Model
{
    use HasFactory;
    protected $table = 'Usuario';  
    protected $primaryKey = 'idUsuario';  

    protected $fillable = [
        'password',
        'estado',
        'usuario',
        'idEmpleado',
        'idRol'
    ];

    public $timestamps = false;
}
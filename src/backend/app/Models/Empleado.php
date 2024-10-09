<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empleado extends Model
{
    use HasFactory;
    protected $table = 'Empleado';  
    protected $primaryKey = 'idEmpleado';  

    protected $fillable = [
        'nombre',
        'telefono',
        'email',
        'estado',
        'idSucursal'
    ];

    public $timestamps = false;

    public function sucursal()
    {
        return $this->belongsTo(Sucursal::class, 'idSucursal');
    }
}

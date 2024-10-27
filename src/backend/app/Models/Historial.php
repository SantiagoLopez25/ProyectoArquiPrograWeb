<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Historial extends Model
{
    use HasFactory;
    protected $table = 'historial';  
    protected $primaryKey = 'idHistorial';  

    protected $fillable = [
        'descripcion',
        'fecha',
        'idUsuario'
    ];

    public $timestamps = false;

    public function usuario()
    {
        return $this->belongsTo(Usuario::class, 'idUsuario');
    }
}

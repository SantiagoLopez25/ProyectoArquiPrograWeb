<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Marca extends Model
{
    use HasFactory;
    protected $table = 'marca';  
    protected $primaryKey = 'idMarca';  

    protected $fillable = [
        'nombre',
        'estado'
    ];

    public $timestamps = false;
}

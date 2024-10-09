<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contacto extends Model
{
    use HasFactory;
    protected $table = 'Contacto';  
    protected $primaryKey = 'idContacto';  

    protected $fillable = [
        'telefono',
        'email',
        'idCliente'
    ];

    public $timestamps = false;
    
}

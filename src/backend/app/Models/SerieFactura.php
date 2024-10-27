<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SerieFactura extends Model
{
    use HasFactory;

    protected $table = 'seriefactura';  
    protected $primaryKey = 'idSerie';  

    protected $fillable = [
        'fechaInicio',
        'estado'
    ];

    public $timestamps = false;
}

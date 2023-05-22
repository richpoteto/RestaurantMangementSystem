<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Translation extends Model
{
    use HasFactory;

    public $timestamps = false; 
    
    protected $fillable = [
        'translationable_type',
        'translationable_id',
        'locale',
        'key',
        'value',
    ];

    public function translationable()
    {
        return $this->morphTo();
    }
}

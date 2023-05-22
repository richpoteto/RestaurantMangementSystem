<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    protected $fillable = [
        'country','currency_code', 'currency_symbol', 'exchange_rate'
    ];
}

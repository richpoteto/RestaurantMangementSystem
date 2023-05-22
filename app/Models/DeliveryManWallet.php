<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryManWallet extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */

    protected $casts = [
        'collected_cash' => 'float',
        'total_earning' => 'float',
        'total_withdrawn' => 'float',
        'pending_withdraw' => 'float',
    ];

    protected $fillable = ['delivery_man_id'];
}

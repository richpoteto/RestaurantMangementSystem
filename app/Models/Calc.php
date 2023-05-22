<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Calc extends Model
{
    use HasFactory;

    protected $casts = [
        'new_venue_days_calc' => 'integer',
        'nearby_distance_max_calc' => 'integer',
        'trending_threshold_value' => 'integer',
        'average_system_order'=>'integer',
    ];
}

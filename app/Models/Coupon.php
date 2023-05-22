<?php

namespace App\Models;

use App\Scopes\RestaurantScope;
use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    protected $casts = [
        'min_purchase' => 'float',
        'max_discount' => 'float',
        'discount' => 'float',
        'limit'=>'integer',
    ];
    public function scopeActive($query)
    {
        return $query->where('status', '=', 1);
    }
    
    // protected static function booted()
    // {
    //     if(auth('vendor')->check())
    //     {
    //         static::addGlobalScope(new RestaurantScope);
    //     } 
    // }
}

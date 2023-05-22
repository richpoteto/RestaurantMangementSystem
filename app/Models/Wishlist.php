<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model
{
    protected $casts = [
        'food_id' => 'integer',
        'user_id' => 'integer',
        'vendor_id' => 'integer',
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    public function food()
    {
        return $this->belongsTo(Food::class);
    }
    
    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function vendor(){
        return $this->belongsTo(Vendor::class);
    }
}

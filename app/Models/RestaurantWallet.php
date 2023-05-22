<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RestaurantWallet extends Model
{
    use HasFactory;

     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['vendor_id'];

    public function getBalanceAttribute()
    {
        return $this->total_earning - ($this->total_withdrawn + $this->pending_withdraw + $this->collected_cash);
    }
}

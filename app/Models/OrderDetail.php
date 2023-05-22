<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;

    protected $casts = [
        'price' => 'float',
        'discount_on_food' => 'float',
        'total_add_on_price' => 'float',
        'tax_amount' => 'float',
        'food_id'=> 'integer',
        'order_id'=> 'integer',
        'quantity'=>'integer',
        'item_campaign_id'=>'integer'
    ];

    protected $primaryKey   = 'id';

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
    public function vendor()
    {
        return $this->order->restaurant();
    }
    public function food()
    {
        return $this->belongsTo(Food::class,'food_id');
    }
    public function campaign()
    {
        return $this->belongsTo(ItemCampaign::class, 'item_campaign_id');
    }
}

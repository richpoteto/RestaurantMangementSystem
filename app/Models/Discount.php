<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'start_date','end_date','start_time','end_time','min_purchase','max_discount','discount','discount_type','restaurant_id',
    ];
    protected $casts = [
        'min_purchase' => 'float',
        'max_discount' => 'float',
        'discount' => 'float',
        'restaurant_id'=>'integer'
    ];
    protected $dates = ['created_at', 'updated_at'];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function scopeValidate($query)
    {
        $query->whereDate('start_date','<=',date('Y-m-d'))->whereDate('end_date','>=',date('Y-m-d'))->whereTime('start_time','<=',date('H:i:s'))->whereTime('end_time','>=',date('H:i:s'));
    }
}

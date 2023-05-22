<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Scopes\ZoneScope;

class ProvideDMEarning extends Model
{
    use HasFactory;

    public function delivery_man()
    {
        return $this->belongsTo(DeliveryMan::class, 'delivery_man_id');
    }

    protected static function booted()
    {
        static::addGlobalScope(new ZoneScope);
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Scopes\ZoneScope;

class FeaturedVenue extends Model
{
    use HasFactory;
    protected $table = 'featured_venues';
    
    public function zone()
    {
        return $this->belongsTo(Zone::class);
    }
    
    public function scopeActive($query)
    {
        return $query->where('status', '=', 1);
    }

    protected static function booted()
    {
        static::addGlobalScope(new ZoneScope);
    }
}

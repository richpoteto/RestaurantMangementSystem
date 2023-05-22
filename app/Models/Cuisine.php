<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class Cuisine extends Model
{
    use HasFactory;

    protected $casts = [
        'name' => 'string',
        'category_id' => 'integer',
        'sub_cat_id' => 'integer',
        'sub_sub_cat_id' => 'integer',
        'active_status' => 'integer',
        'description' => 'string'
    ];

    public function translations()
    {
        return $this->morphMany(Translation::class, 'translationable');
    }

    public function scopeActive($query)
    {
        return $query->where('active_status', '=', 1);
    }

    public function childes()
    {
        return $this->hasMany(Cuisine::class, 'category_id');
    }

    public function parent()
    {
        return $this->belongsTo(Cuisine::class, 'category_id');
    }

    protected static function booted()
    {
        static::addGlobalScope('translate', function (Builder $builder) {
            $builder->with(['translations' => function ($query) {
                return $query->where('locale', app()->getLocale());
            }]);
        });
    }
}

<?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;

class ZoneScope implements Scope
{
    /**
     * Apply the scope to a given Eloquent query builder.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $builder
     * @param  \Illuminate\Database\Eloquent\Model  $model
     * @return void
     */
    public function apply(Builder $builder, Model $model)
    {
        if(auth('admin')->user() && auth('admin')->user()->role_id != 1 && auth('admin')->user()->zone_id)
        {
            $class = get_class($model);
            switch ($class) {
                case 'App\Models\Food':
                    $builder->whereHas('restaurant',function($query){
                        return $query->where('zone_id', auth('admin')->user()->zone_id);
                    });        
                    break;
                
                case 'App\Models\ItemCampaign':
                    $builder->whereHas('restaurant',function($query){
                        return $query->where('zone_id', auth('admin')->user()->zone_id);
                    });        
                    break;
                    
                case 'App\Models\Order':
                    $builder->whereHas('restaurant',function($query){
                        return $query->where('zone_id', auth('admin')->user()->zone_id);
                    });        
                    break;

                case 'App\Models\Restaurant':
                    $builder->where('zone_id', auth('admin')->user()->zone_id);       
                    break;
                
                case 'App\Models\AddOn':
                    $builder->whereHas('restaurant',function($query){
                        return $query->where('zone_id', auth('admin')->user()->zone_id);
                    });  
                    break;

                case 'App\Models\WithdrawRequest':
                    $builder->whereHas('vendor.restaurants',function($query){
                        return $query->where('restaurants.zone_id', auth('admin')->user()->zone_id);
                    });  
                    break;
                    
                case 'App\Models\DeliveryMan':
                    $builder->where('zone_id', auth('admin')->user()->zone_id);       
                    break;

                case 'App\Models\Banner':
                    $builder->where('zone_id', auth('admin')->user()->zone_id);       
                    break;

                case 'App\Models\Notification':
                    $builder->where('zone_id', auth('admin')->user()->zone_id);       
                    break;

                case 'App\Models\Zone':
                    $builder->where('id', auth('admin')->user()->zone_id);       
                    break;

                case 'App\Models\ProvideDMEarning':
                    $builder->whereHas('delivery_man', function($q){
                        $q->where('zone_id', auth('admin')->user()->zone_id);   
                    });
                    break;
                    
                default:
                    $builder;
                    break;
            }
        }
        $builder;   
    }
}
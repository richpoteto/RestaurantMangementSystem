<?php

namespace App\CentralLogics;

use App\Models\Campaign;
use App\CentralLogics\Helpers;

class CampaignLogic
{
    public static function get_basic_campaigns($restaurant_id, $limit = 25, $offset = 1)
    {
        $data = [];
        $paginator=Campaign::with('restaurants')->latest()->paginate($limit, ['*'], 'page', $offset);
        foreach ($paginator->items() as $item) {
            $variations = [];
            $restaurant_ids = count($item->restaurants)?$item->restaurants->pluck('id')->toArray():[];
            if($item->start_date)
            {
                $item['available_date_starts']=$item->start_date->format('Y-m-d');
                unset($item['start_date']);
            }
            if($item->end_date)
            {
                $item['available_date_ends']=$item->end_date->format('Y-m-d');
                unset($item['end_date']);
            }
            $item['is_joined'] = in_array($restaurant_id, $restaurant_ids)?true:false;
            unset($item['restaurants']);
            array_push($data, $item);
        }
        return [
            'total_size' => $paginator->total(),
            'limit' => $limit,
            'offset' => $offset,
            'campaigns' => $data
        ];
    }
}

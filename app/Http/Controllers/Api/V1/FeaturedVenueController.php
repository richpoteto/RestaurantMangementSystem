<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\FeaturedVenue;
use App\CentralLogics\RestaurantLogic;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class FeaturedVenueController extends Controller
{
    public function get_featured_venues(Request $request)
    {        
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 403);
        }

        $filterBy = 'all';
        $type = $request->query('type', 'all');
        
        $limit = $request->has('limit')?$request->limit:10;
        $offset = $request->has('offset')?$request->offset:1;
        // $zone_id= json_decode($request->header('zoneId'), true);        
        $featured_venues = RestaurantLogic::get_featured_restaurants($filterBy, $limit, $offset, $type);
        return response()->json($featured_venues, 200);
    }
}

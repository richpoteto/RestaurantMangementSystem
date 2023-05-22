<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\HottestLounge;
use App\CentralLogics\RestaurantLogic;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class HottestLoungeController extends Controller
{
    public function get_hottest_lounges(Request $request)
    {        
        // Log::channel('stderr')->info($request);
        $filterBy = 'all';
        $type = $request->query('type', 'all');
        $limit = $request->has('limit')?$request->limit:10;
        $offset = $request->has('offset')?$request->offset:1;
              
        $hottest_lounges = RestaurantLogic::get_hottest_lounges($filterBy, $limit, $offset, $type);
        // Log::channel('stderr')->info($hottest_lounges);
        return response()->json($hottest_lounges, 200);
    }
}

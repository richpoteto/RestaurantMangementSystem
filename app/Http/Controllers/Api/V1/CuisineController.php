<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Cuisine;
use App\CentralLogics\Helpers;
use Illuminate\Http\Request;

class CuisineController extends Controller
{
    public function get_cuisines()
    {
        try {
            $cuisine = Cuisine::where(['active_status'=>1])
                ->orderBy('priority', 'DESC')
                ->orderBy('updated_at', 'DESC')
                ->get();
            return response()->json(Helpers::category_data_formatting($cuisine, true), 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}

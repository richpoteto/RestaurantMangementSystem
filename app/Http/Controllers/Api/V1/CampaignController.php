<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Campaign;
use App\Models\ItemCampaign;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;

class CampaignController extends Controller
{
    public function get_basic_campaigns(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= json_decode($request->header('zoneId'), true);
        try {
            $campaigns = Campaign::whereHas('restaurants', function($query)use($zone_id){
                $query->whereIn('zone_id', $zone_id);
            })
            ->with('restaurants',function($query)use($zone_id){
                return $query->WithOpen()->whereIn('zone_id', $zone_id);
            })
            ->running()->active()->get();
            $campaigns=Helpers::basic_campaign_data_formatting($campaigns, true);
            return response()->json($campaigns, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function basic_campaign_details(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= json_decode($request->header('zoneId'), true);

        $validator = Validator::make($request->all(), [
            'basic_campaign_id' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }
        try {
            $campaign = Campaign::with(['restaurants'=>function($q)use($zone_id){
                $q->whereIn('zone_id', $zone_id);
            }])
            ->with('restaurants',function($query)use($zone_id){
                return $query->WithOpen()->whereIn('zone_id', $zone_id);
            })
            ->running()->active()->whereId($request->basic_campaign_id)->first();

            $campaign=Helpers::basic_campaign_data_formatting($campaign, false);

            $campaign['restaurants'] = Helpers::restaurant_data_formatting($campaign['restaurants'], true);

            return response()->json($campaign, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
    public function get_item_campaigns(Request $request){
        if (!$request->hasHeader('zoneId')) {
            $errors = [];
            array_push($errors, ['code' => 'zoneId', 'message' => trans('messages.zone_id_required')]);
            return response()->json([
                'errors' => $errors
            ], 200);
        }
        $zone_id= json_decode($request->header('zoneId'), true);
        try {
            $campaigns = ItemCampaign::active()->whereHas('restaurant', function($query)use($zone_id){
                $query->whereIn('zone_id', $zone_id);
            })->running()->active()->get();
            $campaigns= Helpers::product_data_formatting($campaigns, true, false, app()->getLocale());
            return response()->json($campaigns, 200);
        } catch (\Exception $e) {
            return response()->json([], 200);
        }
    }
}

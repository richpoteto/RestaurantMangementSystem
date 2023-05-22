<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\CreditCards;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CreditcardsController extends Controller
{
    public function get_credit_cards(Request $request)
    {        
        // Log::channel('stderr')->info($request);            
        $creditcards = CreditCards::where('user_id', $request->user()->id)->all();
        // Log::channel('stderr')->info($creditcards);
        return response()->json($creditcards, 200);
    }

    public function add_to_creditcards(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'card_number' => 'required_without:card_number',
            'expires_mm' => 'required_without:expires_mm',
            'expires_yy' => 'required_without:expires_yy',
            'cvv' => 'required_without:cvv',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $creditcard = CreditCards::when($request->id, function($query)use($request){
            return $query->where('id', $request->id);
        })->where('user_id', $request->user()->id)->get();
        if (empty($creditcard)) {
            $creditcard = new creditcards;
            $creditcard->user_id = $request->user()->id;
            $creditcard->card_number = $request->card_number;
            $creditcard->expires_mm = $request->expires_mm;
            $creditcard->expires_yy = $request->expires_yy;
            $creditcard->cvv = $request->cvv;
            $creditcard->f_name = $request->f_name;
            $creditcard->l_name = $request->l_name;

            $creditcard->save();
            return response()->json(['message' => trans('messages.added_successfully')], 200);
        }

        return response()->json(['message' => trans('messages.already_in_creditcard')], 409);
    }

    public function remove_from_creditcards(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'card_number' => 'required_without:card_number',
            'expires_mm' => 'required_without:expires_mm',
            'expires_yy' => 'required_without:expires_yy',
            'cvv' => 'required_without:cvv',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $creditcard = CreditCards::when($request->id, function($query)use($request){
            return $query->where('id', $request->id);
        })->where('user_id', $request->user()->id)->first();

        if ($creditcard) {
            $creditcard->delete();
            return response()->json(['message' => trans('messages.successfully_removed')], 200);
        }
        return response()->json(['message' => trans('messages.not_found')], 404);
    }
}
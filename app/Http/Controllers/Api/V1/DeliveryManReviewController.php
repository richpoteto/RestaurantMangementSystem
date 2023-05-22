<?php

namespace App\Http\Controllers\Api\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\DeliveryMan;
use App\Models\DMReview;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class DeliveryManReviewController extends Controller
{
    public function get_reviews($id)
    {
        $reviews = DMReview::with(['customer', 'delivery_man'])->where(['delivery_man_id' => $id])->active()->get();

        $storage = [];
        foreach ($reviews as $item) {
            $item['attachment'] = json_decode($item['attachment']);
            array_push($storage, $item);
        }

        return response()->json($storage, 200);
    }

    public function get_rating($id)
    {
        try {
            $totalReviews = DMReview::where(['delivery_man_id' => $id])->get();
            $rating = 0;
            foreach ($totalReviews as $key => $review) {
                $rating += $review->rating;
            }

            if ($rating == 0) {
                $overallRating = 0;
            } else {
                $overallRating = number_format($rating / $totalReviews->count(), 2);
            }

            return response()->json(floatval($overallRating), 200);
        } catch (\Exception $e) {
            return response()->json(['errors' => $e], 403);
        }
    }

    public function submit_review(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'delivery_man_id' => 'required',
            'order_id' => 'required',
            'comment' => 'required',
            'rating' => 'required|numeric|max:5',
        ]);

        $dm = DeliveryMan::find($request->delivery_man_id);
        if (isset($dm) == false) {
            $validator->errors()->add('delivery_man_id', trans('messages.not_found'));
        }

        if ($validator->errors()->count() > 0) {
            return response()->json(['errors' => Helpers::error_processor($validator)], 403);
        }

        $multi_review = DMReview::where(['delivery_man_id' => $request->delivery_man_id, 'user_id' => $request->user()->id, 'order_id'=>$request->order_id])->first();
        if (isset($multi_review)) {
            return response()->json([
                'errors' => [ 
                    ['code'=>'review','message'=> trans('messages.already_submitted')]
                ]
            ], 403);
        }


        $image_array = [];
        if (!empty($request->file('attachment'))) {
            foreach ($request->file('attachment') as $image) {
                if ($image != null) {
                    if (!Storage::disk('public')->exists('review')) {
                        Storage::disk('public')->makeDirectory('review');
                    }
                    array_push($image_array, Storage::disk('public')->put('review', $image));
                }
            }
        }

        $review = new DMReview();
        $review->user_id = $request->user()->id;
        $review->delivery_man_id = $request->delivery_man_id;
        $review->order_id = $request->order_id;
        $review->comment = $request->comment;
        $review->rating = $request->rating;
        $review->attachment = json_encode($image_array);
        $review->save();

        return response()->json(['message' => trans('messages.review_submited_successfully')], 200);
    }
}

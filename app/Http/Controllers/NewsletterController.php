<?php

namespace App\Http\Controllers;
use App\Models\Newsletter;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;

class NewsletterController extends Controller
{
    // Save newsLetterSubscribe email
    public function newsLetterSubscribe(Request $request)
    {
        $emailCount = Newsletter::where('email', $request->email)->count();
        if ($emailCount) {
            Toastr::warning(trans('messages.subscription_exist'));
            return back();
        } else {
            Newsletter::create($request->all());
            Toastr::success(trans('messages.subscription_successful'));
            return back();
        }
    }


}

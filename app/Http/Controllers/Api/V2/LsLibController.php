<?php

namespace App\Http\Controllers\Api\V2;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class LsLibController extends Controller
{
    public function lib_update(Request $request)
    {
        return response()->json([
            'message' => 'thanks'
        ], 200);
    }
}

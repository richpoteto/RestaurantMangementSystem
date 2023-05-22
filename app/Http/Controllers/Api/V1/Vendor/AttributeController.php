<?php

namespace App\Http\Controllers\Api\V1\Vendor;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use Illuminate\Http\Request;


class AttributeController extends Controller
{
    function list(Request $request)
    {
        // $limit = $request['limite']??25;
        // $offset = $request['offset']??1;
        $attributes = Attribute::orderBy('name')->get();
        // ->paginate($limit, ['*'], 'page', $offset);
        // $data = [
        //     'total_size' => $attributes->total(),
        //     'limit' => $limit,
        //     'offset' => $offset,
        //     'attributes' => $attributes->items()
        // ];

        return response()->json($attributes,200);
    }
}

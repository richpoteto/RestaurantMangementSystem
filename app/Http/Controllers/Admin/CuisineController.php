<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Cuisine;
use App\Models\Category;
use App\Models\Translation;
use App\CentralLogics\Helpers;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class CuisineController extends Controller
{
    function index()
    {
        return view('admin-views.cuisine.index');
    }

    public function list(Request $request)
    {
        $cuisines = Cuisine::where('active_status', 1)
        ->orderBy('priority', 'DESC')
        ->orderBy('updated_at', 'DESC')
        ->latest()->paginate(config('default_pagination'));
        return view('admin-views.cuisine.list',compact('cuisines'));
    }
    
    function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:191',
            'image' => 'required',
            'description' => 'required|max:1000',
        ], [
            'name.required' => trans('messages.cuisine_name_required'),
            'image.required' => trans('messages.image_required'),
            'description.required' => trans('messages.description_length_warning'),
        ]);
        
        if ($validator->fails())
        {
            Toastr::success(trans('messages.failed_create_cuisine'));
        }else{
            try{
                $cuisine = new Cuisine();
                
                $cuisine->name = $request->name;
                $cuisine->description = $request->description;
                $cuisine->image = $request->has('image') ? Helpers::upload('cuisine/', 'png', $request->file('image')) : 'def.png';
                
                $cuisine->active_status = 1;
                $cuisine->created_at = now();
                $cuisine->updated_at = now();
                
                $cuisine->save();
            }catch(Exception $e){
                echo $e->getMessage();
            }
    
            $data = [];
            foreach($request->lang as $index=>$key)
            {
                if($request->name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Cuisine',
                        'translationable_id'    => $cuisine->id,
                        'locale'                => $key,
                        'key'                   => 'name',
                        'value'                 => $request->name[$index],
                    ));
                }
            }
            if(count($data))
            {
                Translation::insert($data);
            }
    
            Toastr::success(trans('messages.cuisine_added_successfully'));
            return back();
        }
    }

    public function edit($id)
    {
        $cuisine = Cuisine::find($id);
        return view('admin-views.cuisine.edit', compact('cuisine'));
    }
    
    public function change_priority($id, Request $request){
        $cuisine = Cuisine::where('id', $id)->first();
        $cuisine->priority = $request->priority;
        $cuisine->updated_at = now();
        $cuisine->save();
        return back();
    }

    public function change_feature(Cuisine $cuisine, Request $request)
    {
        $cuisine->c_featured = $request->c_featured;
        $cuisine->updated_at = now();
        $cuisine->save();
        return back();
    }
    
    public function change_trending(Cuisine $cuisine, Request $request){
        $cuisine->c_trending = $request->c_trending;
        $cuisine->updated_at = now();
        $cuisine->save();
        return back();
    }

    public function status(Request $request)
    {
        $cuisine = Cuisine::find($request->id);
        $cuisine->active_status = $request->active_status;
        $cuisine->save();
        Toastr::success(trans('messages.status_updated'));
        return back();
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|max:100',
        ]);
        $cuisine = Cuisine::find($id);

        $cuisine->name = $request->name;
        $cuisine->image = $request->has('image') ? Helpers::update('cuisine/', $cuisine->image, 'png', $request->file('image')) : $cuisine->image;
        $cuisine->updated_at = now();
        $cuisine->save();
        foreach($request->lang as $index=>$key)
        {
            if($request->name[$index] && $key != 'en')
            {
                Translation::updateOrInsert(
                    ['translationable_type'  => 'App\Models\Cuisine',
                        'translationable_id'    => $cuisine->id,
                        'locale'                => $key,
                        'key'                   => 'name'],
                    ['value'                 => $request->name[$index]]
                );
            }
        }
        Toastr::success(trans('messages.cuicine_updated_successfully'));
        return back();
    }

    public function delete(Request $request)
    {
        $cuisine = Cuisine::find($request->id);
        $cuisine->delete();
        Toastr::success('Cuisine removed!');
        return back();
    }

    public function get_all(Request $request){
        $data = Cuisine::where('name', 'like', '%'.$request->q.'%')->limit(8)->get([DB::raw('id, CONCAT(name, " (", if(position = 0, "'.trans('messages.main').'", "'.trans('messages.sub').'"),")") as text')]);
        if(isset($request->all))
        {
            $data[]=(object)['id'=>'all', 'text'=>'All'];
        }
        return response()->json($data);
    }
}

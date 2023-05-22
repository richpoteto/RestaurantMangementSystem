<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Tables;
use App\Models\Restaurant;
use App\CentralLogics\Helpers;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class TablesController extends Controller
{
    public function index(){
        try{
            
            $restaurants = Restaurant::where('active', 1)->latest()->paginate(config('default_pagination'));
            return view('admin-views.tables.index',compact('restaurants'));
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }   
    
    public function list(){
        try{
            $tables = Tables::with('venue')->latest()->paginate(config('default_pagination'));
            return view('admin-views.tables.list',compact('tables'));
        }
        catch(\Exception $e){
            var_dump($e);
            return response()->json(['error' => $e], 201);
        }
    } 
    
    public function add_table(Request $request){
        $validator = Validator::make($request->all(), [
            'table_name' => 'required',
            'image' => 'required',
            'venue_id' => 'required',
        ], [
            'table_name.required' => trans('messages.name_required'),
            'image.required' => trans('messages.image_required'),
            'venue_id.required' => trans('messages.venue_required'),
        ]);
        
        if ($validator->fails())
        {
            Toastr::success(trans('messages.failed_create_table'));
        }else{
            try{
                $tables = new Tables;
                
                $tables->table_name = $request->table_name;
                $tables->venue_id = $request->venue_id;
                $tables->capacity = $request->has('capacity') ? $request->capacity : 5;
                $tables->floor_number = $request->has('floor_number') ? $request->floor_number : 1;
                $tables->image = $request->has('image') ? Helpers::upload('tables/', 'png', $request->file('image')) : 'def.png';
                
                $tables->reserved_status = 0;
                $tables->status = 1;
                $tables->created_at = now();
                $tables->updated_at = now();
                
                $tables->save();
            }catch(Exception $e){
                echo $e->getMessage();
            }
    
            $data = [];
            foreach($request->lang as $index=>$key)
            {
                if($request->table_name[$index] && $key != 'en')
                {
                    array_push($data, Array(
                        'translationable_type'  => 'App\Models\Tables',
                        'translationable_id'    => $tables->id,
                        'locale'                => $key,
                        'key'                   => 'table_name',
                        'value'                 => $request->table_name[$index],
                    ));
                }
            }
            if(count($data))
            {
                Translation::insert($data);
            }
    
            Toastr::success(trans('messages.table_added_successfully'));
            return back();
        }
    }
    
    public function get_tables(Request $request){
        try{
            if($request->venue_id == 'all'){
                $tables = Tables::all();
                $venueid = 'all';
                return view('admin-views.tables.list',compact('tables', 'venueid'));
            }else{
                $venue_id = $request->query('venue_id', 'all');
                $tables = Tables::when($venue_id, function($query)use($venue_id){
                        return $query->where('venue_id', $venue_id);
                })->with('venue')->latest()->paginate(config('default_pagination'));
                $venueid = $request->venue_id;
                
                return view('admin-views.tables.list',compact('tables', 'venueid'));
            }
        }
        catch(\Exception $e){
            return response()->json(['error' => $e], 201);
        }
    }

    public function edit($id)
    {
        $table = Tables::find($id);
        return view('admin-views.tables.edit', compact('table'));
    }

    public function delete(Request $request)
    {
        $table = Tables::find($request->id);
        $table->delete();
        Toastr::success('Table removed!');
        return back();
    }
    
    public function update(Request $request, $id){
        $validator = Validator::make($request->all(), [
            'table_name' => 'required',
        ], [
            'table_name.required' => trans('messages.name_required'),
        ]);
        
        if ($validator->fails())
        {
            Toastr::success(trans('messages.failed_update_table'));
        }else{
            try{
                $table = Tables::find($id);
                $table->table_name = $request->table_name;
                $table->capacity = $request->has('capacity') ? $request->capacity : $table->capacity;
                $table->floor_number = $request->has('floor_number') ? $request->floor_number : $table->floor_number;
                $table->image = $request->has('image') ? Helpers::update('tables/', $table->image, 'png', $request->file('image')) : $table->image;
                
                $table->updated_at = now();
                $table->save();
                
                Toastr::success(trans('messages.table_updated'));
                return back();
            }catch(\Exception $e){
                return response()->json(['error' => $e], 201);
            }
        }
    }   
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Conversation;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ConversationController extends Controller
{
    public function list()
    {
        $conversations = DB::table('conversations')
            ->latest()
            ->get();
        return view('admin-views.messages.index', compact('conversations'));
    }

    public function view($user_id)
    {
        $convs = Conversation::where(['user_id' => $user_id])->get();
        Conversation::where(['user_id' => $user_id])->update(['checked' => 1]);
        $user = User::find($user_id);
        return response()->json([
            'view' => view('admin-views.messages.partials._conversations', compact('convs', 'user'))->render()
        ]);
    }

    public function store(Request $request, $user_id)
    {
        $validator = Validator::make($request->all(), [
            'reply' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json([], 403);
        }

        DB::table('conversations')->insert([
            'user_id' => $user_id,
            'reply' => $request->reply,
            'checked' => 1,
            'created_at' => now(),
            'updated_at' => now()
        ]);
        $convs = Conversation::where(['user_id' => $user_id])->get();
        $user = User::find($user_id);
        return response()->json([
            'view' => view('admin-views.messages.partials._conversations', compact('convs', 'user'))->render()
        ]);
    }
}

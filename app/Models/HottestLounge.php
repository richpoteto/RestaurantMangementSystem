<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Scopes\ZoneScope;

class HottestLounge extends Model
{
    use HasFactory;
    protected $table = 'hottest_lounges';    
    
}

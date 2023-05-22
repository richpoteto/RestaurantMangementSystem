@php($data=[])
<?php
foreach ($restaurant->schedules as $schedule)
{
    $data[$schedule->day][]=['id'=>$schedule->id,'start_time'=>$schedule->opening_time, 'end_time'=>$schedule->closing_time];
}
?>
<div class="my-2 p-1 border rounded">
    <span class="btn btn-dark">{{__('messages.monday')}} :</span>
    @if(isset($data['1']) && count($data['1']))
        @foreach ($data['1'] as $day)
            <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
        @endforeach
    @else
        <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
    @endif
    <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="1" data-day="{{__('messages.monday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
    <span class="btn btn-dark">{{__('messages.tuesday')}} :</span>
    @if(isset($data['2']) && count($data['2']))
        @foreach ($data['2'] as $day)
            <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
        @endforeach
    @else
        <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
    @endif
    <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="2" data-day="{{__('messages.tuesday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
        <span class="btn btn-dark">{{__('messages.wednesday')}} :</span>
        @if(isset($data['3']) && count($data['3']))
            @foreach ($data['3'] as $day)
                <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
            @endforeach
        @else
            <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
        @endif
        <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="3" data-day="{{__('messages.wednesday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
        <span class="btn btn-dark">{{__('messages.thirsday')}} :</span>
        @if(isset($data['4']) && count($data['4']))
            @foreach ($data['4'] as $day)
                <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
            @endforeach
        @else
            <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
        @endif
        <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="4" data-day="{{__('messages.thirsday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
        <span class="btn btn-dark">{{__('messages.friday')}} :</span>
        @if(isset($data['5']) && count($data['5']))
            @foreach ($data['5'] as $day)
                <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
            @endforeach
        @else
            <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
        @endif
        <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="5" data-day="{{__('messages.friday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
        <span class="btn btn-dark">{{__('messages.saturday')}} :</span>
        @if(isset($data['6']) && count($data['6']))
            @foreach ($data['6'] as $day)
                <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
            @endforeach
        @else
            <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
        @endif
        <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="6" data-day="{{__('messages.saturday')}}"><i class="tio-add"></i></span>
</div>

<div class="my-2 p-1 border rounded">
        <span class="btn btn-dark">{{__('messages.sunday')}} :</span>
        @if(isset($data['0']) && count($data['0']))
            @foreach ($data['0'] as $day)
                <span class="btn btn-sm btn-outline-dark m-1 disabled">{{date(config('timeformat'), strtotime($day['start_time']))}} - {{date(config('timeformat'), strtotime($day['end_time']))}} <span class="badge badge-danger rounded-circle cursor-pointer" onclick="delete_schedule('{{route('admin.vendor.remove-schedule',['restaurant_schedule'=>$day['id']])}}')">X</span></span>
            @endforeach
        @else
            <span class="btn btn-sm btn-outline-danger m-1 disabled">{{__('messages.Offday')}}</span>
        @endif
        <span class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-dayid="0" data-day="{{__('messages.sunday')}}"><i class="tio-add"></i></span>
</div>
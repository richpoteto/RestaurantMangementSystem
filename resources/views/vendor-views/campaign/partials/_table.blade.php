@php($restaurant_id = \App\CentralLogics\Helpers::get_restaurant_id())
@foreach($campaigns as $key=>$campaign)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <span class="d-block font-size-sm text-body">
                {{Str::limit($campaign['title'],25,'...')}}
            </span>
        </td>
        <td>
            <div style="overflow-x: hidden;overflow-y: hidden;">
                <img src="{{asset('storage/app/public/campaign')}}/{{$campaign['image']}}" style="width: 100%; max-height:75px; margin-top:auto; margin-bottom:auto;"
                        onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'">
            </div>
        </td>
        <td>
        <?php
            $restaurant_ids = [];
            foreach($campaign->restaurants as $restaurant)
            {
                $restaurant_ids[] = $restaurant->id;
            }
        ?>
            @if(in_array($restaurant_id,$restaurant_ids))
            <button type="button" onclick="location.href='{{route('vendor.campaign.remove-restaurant',[$campaign['id'],$restaurant_id])}}'" title="You are already joined. Click to out from the campaign." class="btn btn-outline-danger">Out</button>
            @else
            <button type="button" class="btn btn-outline-primary" onclick="location.href='{{route('vendor.campaign.addrestaurant',[$campaign['id'],$restaurant_id])}}'" title="Click to join the campaign">Join</button>
            @endif
            
        </td>
    </tr>
@endforeach
@foreach($campaigns as $key=>$campaign)
    <tr>
        <td>{{$key+1}}</td>
        <td>
            <span class="d-block text-body"><a href="{{route('admin.campaign.view',['basic',$campaign->id])}}">{{Str::limit($campaign['title'],25,'...')}}</a>
            </span>
        </td>
        <td>
            <span class="bg-gradient-light text-dark">{{$campaign->start_date?$campaign->start_date->format('d/M/Y'). ' - ' .$campaign->end_date->format('d/M/Y'): 'N/A'}}</span>
        </td>
        <td>
            <span class="bg-gradient-light text-dark">{{$campaign->start_time?date(config('timeformat'),strtotime($campaign->start_time)). ' - ' .date(config('timeformat'),strtotime($campaign->end_time)): 'N/A'}}</span>
        </td>
        <td>
            <label class="toggle-switch toggle-switch-sm" for="stocksCheckbox{{$campaign->id}}">
                <input type="checkbox" onclick="location.href='{{route('admin.campaign.status',['basic',$campaign['id'],$campaign->status?0:1])}}'"class="toggle-switch-input" id="stocksCheckbox{{$campaign->id}}" {{$campaign->status?'checked':''}}>
                <span class="toggle-switch-label">
                    <span class="toggle-switch-indicator"></span>
                </span>
            </label>
        </td>
        <td>
            <a class="btn btn-sm btn-white"
                href="{{route('admin.campaign.edit',['basic',$campaign['id']])}}" title="{{__('messages.edit')}} {{__('messages.campaign')}}"><i class="tio-edit"></i>
            </a>
            <a class="btn btn-sm btn-white text-danger" href="javascript:"
                onclick="form_alert('campaign-{{$campaign['id']}}','{{__('messages.Want_to_delete_this_item')}}')" title="{{__('messages.delete')}} {{__('messages.campaign')}}"><i class="tio-delete-outlined"></i>
            </a>
            <form action="{{route('admin.campaign.delete',[$campaign['id']])}}"
                            method="post" id="campaign-{{$campaign['id']}}">
                @csrf @method('delete')
            </form>
        </td>
    </tr>
@endforeach
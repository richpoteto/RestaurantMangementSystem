@foreach($categories as $key=>$category)
<tr>
    <td>{{$key+1}}</td>
    <td>{{$category->id}}</td>
    <td>
    <span class="d-block font-size-sm text-body">
        {{$category['name']}}
    </span>
    </td>
</tr>
@endforeach

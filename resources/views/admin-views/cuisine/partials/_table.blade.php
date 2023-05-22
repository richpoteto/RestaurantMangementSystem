@foreach($cuisines as $key=>$cuisine)
<tr>
    <td>{{$key+1}}</td>
    <td>{{$cuisine->image}}</td>
    <td>
    <span class="d-block font-size-sm text-body">
        {{Str::limit($cuisine['name'], 20, '...')}}
    </span>
    </td>
    <td>
    <span class="d-block font-size-sm text-body">
        {{Str::limit($cuisine['description'], 20, '...')}}
    </span>
    </td>
    <td>
    <span class="d-block font-size-sm text-body">
        {{Str::limit($cuisine['name'], 20, '...')}}
    </span>
    </td>
</tr>
@endforeach

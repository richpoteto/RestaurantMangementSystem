@foreach($customers as $key=>$customer)
    <tr class="">
        <td class="">
            {{ ++$key }}
        </td>
        <td>
            {{$customer['email']}}
        </td>
    </tr>
@endforeach

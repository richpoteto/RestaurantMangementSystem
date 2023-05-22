<div class="d-flex flex-row" style="max-height: 300px; overflow-y: scroll;">
        <table class="table table-bordered">
            <thead class="text-muted">
                <tr>
                    <th scope="col">{{__('messages.item')}}</th>
                    <th scope="col" class="text-center">{{__('messages.qty')}}</th>
                    <th scope="col">{{__('messages.price')}}</th>
                    <th scope="col">{{__('messages.delete')}}</th>
                </tr>
            </thead>
            <tbody>
            <?php 
                $subtotal = 0;
                $addon_price = 0;
                $tax = \App\CentralLogics\Helpers::get_restaurant_data()->tax;
                $discount = 0;
                $discount_type = 'amount';
                $discount_on_product = 0;
            ?>    
            @if(session()->has('cart') && count( session()->get('cart')) > 0)
                <?php
                    $cart = session()->get('cart');
                    if(isset($cart['tax']))
                    {
                        $tax = $cart['tax'];
                    }
                    if(isset($cart['discount']))
                    {
                        $discount = $cart['discount'];
                        $discount_type = $cart['discount_type'];
                    }
                ?>
                @foreach(session()->get('cart') as $key => $cartItem)
                @if(is_array($cartItem))
                    <?php
                    $product_subtotal = ($cartItem['price'])*$cartItem['quantity'];
                    $discount_on_product += ($cartItem['discount']*$cartItem['quantity']);
                    $subtotal += $product_subtotal;
                    $addon_price += $cartItem['addon_price'];
                    ?>
                <tr>
                    <td class="media align-items-center cursor-pointer" onclick="quickViewCartItem({{$cartItem['id']}}, {{$key}})">          
                        <img class="avatar avatar-sm mr-1" src="{{asset('storage/app/public/product')}}/{{$cartItem['image']}}" 
                                onerror="this.src='{{asset('public/assets/admin/img/160x160/img2.jpg')}}'" alt="{{$cartItem['name']}} image">
                        <div class="media-body">
                            <h5 class="text-hover-primary mb-0">{{Str::limit($cartItem['name'], 10)}}</h5>
                            <small>{{Str::limit($cartItem['variant'], 20)}}</small>
                        </div>
                    </td>
                    <td class="align-items-center text-center">
                        <input type="number"  data-key="{{$key}}" style="width:50px;text-align: center;" value="{{$cartItem['quantity']}}" min="1" onkeyup="updateQuantity(event)">
                    </td>
                    <td class="text-center px-0 py-1">
                        <div class="btn">
                            {{\App\CentralLogics\Helpers::format_currency($product_subtotal)}}
                        </div> <!-- price-wrap .// -->
                    </td>
                    <td class="align-items-center text-center">
                        <a href="javascript:removeFromCart({{$key}})" class="btn btn-sm btn-outline-danger"> <i class="tio-delete-outlined"></i></a>
                    </td>
                </tr>
                @endif
                @endforeach
            @endif
            </tbody>
        </table>
    </div>

    <?php
        $total = $subtotal+$addon_price;
        $discount_amount = ($discount_type=='percent' && $discount>0)?((($total-$discount_on_product) * $discount)/100):$discount;
        $total -= ($discount_amount + $discount_on_product);
        $total_tax_amount= ($tax > 0)?(($total * $tax)/100):0;
    ?>
    <div class="box p-3">
        <dl class="row text-sm-right">

            <dt  class="col-sm-6">{{__('messages.addon')}}:</dt>
            <dd class="col-sm-6 text-right">{{\App\CentralLogics\Helpers::format_currency($addon_price)}}</dd>

            <dt  class="col-sm-6">{{__('messages.subtotal')}}:</dt>
            <dd class="col-sm-6 text-right">{{\App\CentralLogics\Helpers::format_currency($subtotal+$addon_price)}}</dd>


            <dt  class="col-sm-6">{{__('messages.discount')}} :</dt>
            <dd class="col-sm-6 text-right">- {{\App\CentralLogics\Helpers::format_currency(round($discount_on_product,2))}}</dd>

            <dt  class="col-sm-6">{{__('messages.extra_discount')}} :</dt>
            <dd class="col-sm-6 text-right"><button class="btn btn-sm" type="button" data-toggle="modal" data-target="#add-discount"><i class="tio-edit"></i></button>- {{\App\CentralLogics\Helpers::format_currency(round($discount_amount,2))}}</dd>

            <dt  class="col-sm-6">Tax  : </dt>
            <dd class="col-sm-6 text-right"><button class="btn btn-sm" type="button" data-toggle="modal" data-target="#add-tax"><i class="tio-edit"></i></button>{{\App\CentralLogics\Helpers::format_currency(round($total_tax_amount,2))}}</dd>
            
            <dt  class="col-sm-6">Total: </dt>
            <dd class="col-sm-6 text-right h4 b"> {{\App\CentralLogics\Helpers::format_currency(round($total+$total_tax_amount, 2))}} </dd>
        </dl>
        <div class="row">
            <div class="col-md-6">
                <a href="#" class="btn btn-danger btn-sm btn-block" onclick="emptyCart()"><i
                        class="fa fa-times-circle "></i> {{__('messages.cancel')}} </a>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn  btn-primary btn-sm btn-block" data-toggle="modal" data-target="#paymentModal"><i class="fa fa-shopping-bag"></i>
                    {{__('messages.order')}} </button>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add-discount" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('messages.update_discount')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{route('vendor.pos.discount')}}" method="post" class="row">
                        @csrf
                        <div class="form-group col-sm-6">
                            <label for="">{{__('messages.discount')}}</label>
                            <input type="number" class="form-control" name="discount" min="0" id="discount_input" value="{{$discount}}" max="{{$discount_type=='percent'?100:1000000000}}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="">{{__('messages.type')}}</label>
                            <select name="type" class="form-control" id="discount_input_type" onchange="document.getElementById('discount_input').max=(this.value=='percent'?100:1000000000);">
                                <option value="amount" {{$discount_type=='amount'?'selected':''}}>{{__('messages.amount')}}({{\App\CentralLogics\Helpers::currency_symbol()}})</option>
                                <option value="percent" {{$discount_type=='percent'?'selected':''}}>{{__('messages.percent')}}(%)</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-12">
                            <button class="btn btn-sm btn-primary" type="submit">{{__('messages.submit')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add-tax" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('messages.update_tax')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{route('vendor.pos.tax')}}" method="POST" class="row" id="order_submit_form">
                        @csrf
                        <div class="form-group col-12">
                            <label for="">{{__('messages.tax')}}(%)</label>
                            <input type="number" class="form-control" name="tax" min="0">
                        </div>

                        <div class="form-group col-sm-12">
                            <button class="btn btn-sm btn-primary" type="submit">{{__('messages.submit')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="paymentModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">{{__('messages.payment')}}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="{{route('vendor.pos.order')}}" id='order_place' method="post" class="row">
                        @csrf
                        <input type="hidden" name="user_id" id="customer_id">
                        <div class="form-group col-12">
                            <label class="input-label" for="">{{__('messages.amount')}}({{\App\CentralLogics\Helpers::currency_symbol()}})</label>
                            <input type="number" class="form-control" name="amount" min="0" step="0.01" value="{{round($total+$total_tax_amount, 2)}}">
                        </div>
                        <div class="form-group col-12">
                            <label class="input-label" for="">{{__('messages.type')}}</label>
                            <select name="type" class="form-control">
                                <option value="cash">{{__('messages.cash')}}</option>
                                <option value="card">{{__('messages.card')}}</option>
                            </select>
                        </div>
                        <div class="form-group col-12">
                            <button class="btn btn-sm btn-primary" type="submit">{{__('messages.submit')}}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    
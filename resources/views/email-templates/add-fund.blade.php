<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>{{__('messages.welcome')}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style type="text/css">

  @import url('https://fonts.googleapis.com/css?family=Helvetica:700,400');
  /**
   * Avoid browser level font resizing.
   * 1. Windows Mobile
   * 2. iOS / OSX
   */
    body{
        font-family: 'Helvetica', sans-serif;
        font-style: normal;
    }

    body,
    table,
    td,
    a {
        -ms-text-size-adjust: 100%; /* 1 */
        -webkit-text-size-adjust: 100%; /* 2 */
    }

  /**
   * Remove extra space added to tables and cells in Outlook.
   */
    table,
    td {
        mso-table-rspace: 0pt;
        mso-table-lspace: 0pt;

    }

  /**
   * Better fluid images in Internet Explorer.
   */
    img {
        -ms-interpolation-mode: bicubic;
    }

  /**
   * Remove blue links for iOS devices.
   */
    a[x-apple-data-detectors] {
        font-family: inherit !important;
        font-size: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
        color: inherit !important;
        text-decoration: none !important;
    }

  /**
   * Fix centering issues in Android 4.4.
   */
  /* div[style*="margin: 16px 0;"] {
    margin: 0 !important;
  } */

  /* body {
    width: 100% !important;
    height: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
  } */

  /**
   * Collapse table borders to avoid space between cells.
   */
    table {
        border-collapse: collapse !important;
    }
    .congrats-box {
        margin-top: 10px;
        margin-bottom: 38px;
    }
    .col{
      padding: 11px 0px 11px 0px;
    }
  </style>

</head>
<body style="background-color: #ececec;">
  <?php 
    use App\Models\BusinessSetting;
    $company_phone =BusinessSetting::where('key', 'phone')->first()->value;
    $company_email =BusinessSetting::where('key', 'email_address')->first()->value;
    $company_name =BusinessSetting::where('key', 'business_name')->first()->value;
    $company_address =BusinessSetting::where('key', 'address')->first()->value;
    $logo =BusinessSetting::where('key', 'logo')->first()->value;
    $company_mobile_logo = $logo;
    $company_links = json_decode(BusinessSetting::where('key','landing_page_links')->first()->value, true);
    $note_message = [
      'add_fund_by_admin'=>translate('messages.Rewared by company admin',['company_name'=>ucwords($company_name)]),
      'loyalty_point' => translate('messages.loyalty_point_to_wallet'),
      'referrer'=> translate('messages.earned_from_referrer')
    ];
  ?>
  <div style="height: 100px;background-color: #ececec; width:100%"></div>
  <div style="width:595px;margin:auto; background-color:white; 
              padding-top:40px;padding-bottom:40px;border-radius: 3px; text-align:center; ">
      <div style="display:block;">
        <img src="{{asset('/storage/app/public/business/'.$logo)}}" alt="{{$company_name}}" style="height: 15px; width:auto;">
      </div>
      
      <img src="{{asset('public/assets/admin/img/tick.png')}}" style="height: 50px; width:50px; margin-top:40px;">
      
      <div class="congrats-box">
          <span style="font-weight: 700;font-size: 22px;line-height: 135.5%; display:block; margin-bottom:10px;">{{__('messages.Transaction Sucessfull')}}</span>
          <span style="font-weight: 400;font-size: 16px;line-height: 135.5%; color:#727272; margin-bottom:7px; display:block;">{{__('messages.amount sucessfully credited to your wallet',['amount'=>$data->credit.' '.\App\CentralLogics\Helpers::currency_code()])}}</span>
          <span style="font-weight: 400;font-size: 14px;line-height: 135.5%;color: #182E4B;display:block; margin-bottom:10px;"><span style="font-weight: 700;font-size: 14px;line-height: 18.79px;color: #182E4B;color: #EF7822;">{{__('messages.note')}}: </span>{{in_array($data->transaction_type,$note_message)?$note_message[$data->transaction_type]:translate('messages.add_fund_to_wallet')}} </span>
          <span style="font-weight: 700;font-size: 14px;line-height: 135.5%;color: #182E4B; display:block; margin-bottom: 5px;">{{__('messages.dear')}} {{$data->user->f_name.' '.$data->user->l_name}}</span>
          <span style="font-weight: 400;font-size: 12px;line-height: 135.5%;text-align: center;color: #182E4B;display:block; margin-bottom:34px;">{{__('messages.Thank you for joinning with')}} <span style="color: #EF7822;">{{$company_name}}!</span></span>
      </div>
  
      <div style="background-color: #F5F5F5; width: 90%;margin:auto;margin-top:30px;padding: 10px 20px 20px 5px;">
          <table style="width: 100%; text-transform: capitalize; font-size: 11px;line-height: 13px;text-align: center;color: #242A30;">
              <tbody>
                  <tr style="font-weight: 700;">
                      <th class="col" style="width:10%;">{{__('messages.sl')}}</th>
                      <th class="col" style="width:35%;">{{__('messages.transaction')}} {{__('messages.id')}}</th>
                      <th class="col" style="width:20%">{{__('messages.transaction')}} {{__('messages.date')}}</th>
                      <th class="col" style="width:15%">{{__('messages.credit')}}</th>
                      <th class="col" style="width:15%">{{__('messages.debit')}}</th>
                      <th class="col" style="width:15%;">{{__('messages.balance')}}</th>
                  </tr>
                
                  <tr style="font-weight:400;">
                    <td class="col">1</td>
                    <td class="col">{{$data->transaction_id}}</td>
                    <td class="col">{{$data->created_at}}</td>
                    <td class="col">{{\App\CentralLogics\Helpers::format_currency($data->credit)}}</td>
                    <td class="col">{{\App\CentralLogics\Helpers::format_currency($data->debit)}}</td>
                    <td class="col">{{\App\CentralLogics\Helpers::format_currency($data->balance)}}</td>
                  </tr>
              </tbody>
          </table>
      </div>

      
      <span style="font-weight: 400;font-size: 12px;line-height: 135.5%;color: #5D6774;display:block;margin-top:43px;">{{__('messages.If you require any assistance or have feedback or suggestions about our site, you can email us at')}}
          <a href="mailto:{{$company_email}}" class="email">{{$company_email}}</a>
      </span>
  </div>

  <div style="padding:5px;width:650px;margin:auto;margin-top:5px; margin-bottom:50px;">
      <table style="margin:auto;width:90%; color:#777777;">
          <tbody style="text-align: center;">
    
              <tr>
                  @php($social_media = \App\Models\SocialMedia::active()->get())
                  
                  @if(isset($social_media))
                      <th>
                          @foreach ($social_media as $item)
                            <div style="display: inline-block;" >
                              <a href="{{$item->link}}" target=”_blank”>
                              <img src="{{asset('public/assets/admin/img/'.$item->name.'.png')}}" alt="" style="height: 14px; width:14px; padding: 0px 3px 0px 5px;">
                              </a>
                            </div>
                          @endforeach
                      </th>
                  @endif
              </tr>                 
              <tr>
                  <th >
                      <div style="font-weight: 400;font-size: 11px;line-height: 22px;color: #242A30;"><span style="margin-right:5px;"> <a href="tel:{{$company_phone}}" style="text-decoration: none; color: inherit;">{{__('messages.phone')}}: {{$company_phone}}</a></span> <span><a href="mailto:{{$company_email}}" style="text-decoration: none; color: inherit;">{{__('messages.email')}}: {{$company_email}}</a></span></div>
                      @if ($company_links['web_app_url_status'])
                      <div style="font-weight: 400;font-size: 11px;line-height: 22px;color: #242A30;">
                          <a href="{{$company_links['web_app_url']}}" style="text-decoration: none; color: inherit;">{{$company_links['web_app_url']}}</a></div>
                      @endif 
                      <div style="font-weight: 400;font-size: 11px;line-height: 22px;color: #242A30;">{{$company_address}}</div>
                      <span style="font-weight: 400;font-size: 10px;line-height: 22px;color: #242A30;">{{__('messages.All copy right reserved',['year'=>date('Y'),'title'=>$company_name])}}</span>
                  </th>
              </tr>

          </tbody>
      </table>
  </div>

</body>
</html>
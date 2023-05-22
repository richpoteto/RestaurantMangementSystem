<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>{{__('messages.welcome')}}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style type="text/css">
  /**
   * Google webfonts. Recommended to include the .woff version for cross-client compatibility.
   */
  /* @media screen {
    @font-face {
      font-family: 'Source Sans Pro';
      font-style: normal;
      font-weight: 400;
      src: local('Source Sans Pro Regular'), local('SourceSansPro-Regular'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/ODelI1aHBYDBqgeIAH2zlBM0YzuT7MdOe03otPbuUS0.woff) format('woff');
    }

    @font-face {
      font-family: 'Source Sans Pro';
      font-style: normal;
      font-weight:  650;
      src: local('Source Sans Pro Bold'), local('SourceSansPro-Bold'), url(https://fonts.gstatic.com/s/sourcesanspro/v10/toadOcfmlt9b38dHJxOBGFkQc6VGVFSmCnC_l7QZG60.woff) format('woff');
    }
  } */
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
        margin-top: 47px;
        margin-bottom: 38px;
    }
  </style>

</head>
<body style="background-color: #ececec;margin:0;padding:0;text-align:center;">
  <?php 
    use App\Models\BusinessSetting;
    $company_phone =BusinessSetting::where('key', 'phone')->first()->value;
    $company_email =BusinessSetting::where('key', 'email_address')->first()->value;
    $company_name =BusinessSetting::where('key', 'business_name')->first()->value;
    $company_address =BusinessSetting::where('key', 'address')->first()->value;
    $logo =BusinessSetting::where('key', 'logo')->first()->value;
    $company_mobile_logo = $logo;
    $company_links = json_decode(BusinessSetting::where('key','landing_page_links')->first()->value, true);
?>
  <div style="height: 100px;background-color: #ececec; width:100%"></div>
  <div style="width:595px;margin:auto; background-color:white; 
              padding-top:40px;padding-bottom:40px;border-radius: 3px; text-align:center; ">
      
      <img src="{{asset('/storage/app/public/business/'.$logo)}}" alt="{{$company_name}}" style="height: 15px; width:auto;">
      
      <div class="congrats-box">
          <span style="font-weight: 700;font-size: 25px;line-height: 135.5%;text-align: center;color: #727272; display:block;">{{translate('Password reset token')}}</span>
      </div>
  
      <span style="font-weight: bold;font-size: 16px;line-height: 135.5%;text-align: center;color: #182E4B; display:block; margin-bottom: 5px;">{{translate('messages.dear')}} {{$name}}</span>
      <span style="font-weight: 400;font-size: 14px;line-height: 135.5%;color: #182E4B;display:block; margin-bottom:34px;">{{translate('A request has been received to change password for your')}} <span style="color: #EF7822;">{{$company_name}}</span> {{translate('account')}}. <br> {{translate('Your password reset token is')}}:</span>
      <span style="font-weight: 400;font-size: 12px;line-height: 135.5%;color: #5D6774; display:block; margin-bottom:82px;">
        <span style="background: #EF7822;color: white;padding: 10px;font-size: large;border: 3px solid #EF7822;border-radius: 10px;">{{$token}} </span>
      </span>
      <span style="font-weight: 400;font-size: 12px;line-height: 135.5%;color: #5D6774;">{{__('messages.If you require any assistance or have feedback or suggestions about our site, you can email us at')}}
          <a href="mailto:{{$company_email}}" class="email">{{$company_email}}</a>
      </span>
  </div>

  <div style="padding:5px;width:650px;margin:auto;margin-top:5px; margin-bottom:50px;">
      <table style="margin:auto;width:90%; color:#777777;">
          <tbody style="text-align: center;">
    
              <tr>
                  @php($social_media = \App\Models\SocialMedia::active()->get())
                  
                  @if(isset($social_media))
                    <th style="width: 100%;">
                          @foreach ($social_media as $item)
                            <div style="display:inline-block;">
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
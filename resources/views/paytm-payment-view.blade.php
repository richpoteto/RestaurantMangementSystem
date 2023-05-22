<html>
<head>
    <title>Merchant Check Out Page</title>
</head>
<body>
<center><h1>Please do not refresh this page...</h1></center>
<form method="post" action="<?php echo \Illuminate\Support\Facades\Config::get('config_paytm.PAYTM_TXN_URL') ?>" name="f1">
    <table border="1">
        <tbody>
        @foreach($paramList as $name => $value)
            <input type="hidden" name="{{$name}}" value="{{$value}}">
        @endforeach
        <input type="hidden" name="CHECKSUMHASH" value="{{$checkSum}}">
        </tbody>
    </table>
    <script type="text/javascript">
        document.f1.submit();
    </script>
</form>
</body>
</html>

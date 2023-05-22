@php($params=session('dash_params'))
@if($params['zone_id']!='all')
    @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
@else
    @php($zone_name='All')
@endif
<label class="badge badge-soft-info">( Zone : {{$zone_name}} )</label>


<div class="chartjs-custom mx-auto">
    <canvas id="user-overview" class="mt-2"></canvas>
</div>


<script src="{{asset('public/assets/admin')}}/vendor/chart.js/dist/Chart.min.js"></script>


<script>
    var ctx = document.getElementById('user-overview');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [
                'Customer',
                'Restaurant',
                'Delivery Man'
            ],
            datasets: [{
                label: 'User',
                data: ['{{$data['customer']}}', '{{$data['restaurants']}}', '{{$data['delivery_man']}}'],
                backgroundColor: [
                    '#628395',
                    '#055052',
                    '#53B8BB'
                ],
                hoverOffset: 4
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

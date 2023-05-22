@php($params=session('dash_params'))
@if($params['zone_id']!='all')
    @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
@else
    @php($zone_name='All')
@endif
<label class="badge badge-soft-info">( Zone : {{$zone_name}} )</label>

<div class="chartjs-custom mx-auto">
    <canvas id="business-overview" class="mt-2"></canvas>
</div>

<script src="{{asset('public/assets/admin')}}/vendor/chart.js/dist/Chart.min.js"></script>

<script>
    var ctx = document.getElementById('business-overview');
    var myChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [
                'Food',
                'Review',
                'Wishlist'
            ],
            datasets: [{
                label: 'Business',
                data: ['{{$data['food']}}', '{{$data['reviews']}}', '{{$data['wishlist']}}'],
                backgroundColor: [
                    '#2C2E43',
                    '#595260',
                    '#B2B1B9'
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

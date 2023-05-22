<div class="card-body">
    <div class="row mb-4">
        <div class="col-sm mb-2 mb-sm-0">
            @php($params=session('dash_params'))
            @if($params['zone_id']!='all')
                @php($zone_name=\App\Models\Zone::where('id',$params['zone_id'])->first()->name)
            @else
                @php($zone_name='All')
            @endif
            <div class="d-flex align-items-center">
                <span class="h3 mb-0">
                    <span class="legend-indicator bg-primary" style="background-color: #511281!important;"></span>
                    {{__('messages.total_sell')}} : {{\App\CentralLogics\Helpers::format_currency(array_sum($total_sell))}}
                      <label style="font-size: 10px" class="badge badge-soft-info">( Zone : {{$zone_name}} )</label>
                </span>
            </div>
            <div class="d-flex align-items-center mt-2 mb-2">
                <span class="h5 mb-0">
                    <span class="legend-indicator bg-primary" style="background-color: #4CA1A3!important;"></span>
                    {{__('messages.admin_commission')}} : {{\App\CentralLogics\Helpers::format_currency(array_sum($commission))}}
                </span>
            </div>
        </div>

        <div class="col-sm-auto align-self-sm-end">
            <!-- Legend Indicators -->
            <div class="row font-size-sm">
                <div class="col-auto">
                    <h5 class="card-header-title"><i class="tio-chart-bar-4" style="font-size: 50px"></i></h5>
                </div>
            </div>
            <!-- End Legend Indicators -->
        </div>
    </div>
    <!-- End Row -->

    <!-- Bar Chart -->
    <div class="chartjs-custom">
        <canvas id="updatingData" style="height: 20rem;"
                data-hs-chartjs-options='{
                            "type": "bar",
                            "data": {
                              "labels": ["Jan","Feb","Mar","April","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],
                              "datasets": [{
                                "data": [{{$total_sell[1]}},{{$total_sell[2]}},{{$total_sell[3]}},{{$total_sell[4]}},{{$total_sell[5]}},{{$total_sell[6]}},{{$total_sell[7]}},{{$total_sell[8]}},{{$total_sell[9]}},{{$total_sell[10]}},{{$total_sell[11]}},{{$total_sell[12]}}],
                                "backgroundColor": "#511281",
                                "hoverBackgroundColor": "#511281",
                                "borderColor": "#511281"
                              },
                              {
                                "data": [{{$commission[1]}},{{$commission[2]}},{{$commission[3]}},{{$commission[4]}},{{$commission[5]}},{{$commission[6]}},{{$commission[7]}},{{$commission[8]}},{{$commission[9]}},{{$commission[10]}},{{$commission[11]}},{{$commission[12]}}],
                                "backgroundColor": "#4CA1A3",
                                "borderColor": "#4CA1A3"
                              }]
                            },
                            "options": {
                              "scales": {
                                "yAxes": [{
                                  "gridLines": {
                                    "color": "#e7eaf3",
                                    "drawBorder": false,
                                    "zeroLineColor": "#e7eaf3"
                                  },
                                  "ticks": {
                                    "beginAtZero": true,
                                    "stepSize": {{array_sum($total_sell)/5}},
                                    "fontSize": 12,
                                    "fontColor": "#97a4af",
                                    "fontFamily": "Open Sans, sans-serif",
                                    "padding": 10,
                                    "postfix": " {{\App\CentralLogics\Helpers::currency_symbol()}}"
                                  }
                                }],
                                "xAxes": [{
                                  "gridLines": {
                                    "display": false,
                                    "drawBorder": false
                                  },
                                  "ticks": {
                                    "fontSize": 12,
                                    "fontColor": "#97a4af",
                                    "fontFamily": "Open Sans, sans-serif",
                                    "padding": 5
                                  },
                                  "categoryPercentage": 0.5,
                                  "maxBarThickness": "10"
                                }]
                              },
                              "cornerRadius": 2,
                              "tooltips": {
                                "prefix": " ",
                                "hasIndicator": true,
                                "mode": "index",
                                "intersect": false
                              },
                              "hover": {
                                "mode": "nearest",
                                "intersect": true
                              }
                            }
                          }'></canvas>
    </div>
    <!-- End Bar Chart -->
</div>

<script>
    // INITIALIZATION OF CHARTJS
    // =======================================================
    Chart.plugins.unregister(ChartDataLabels);

    $('.js-chart').each(function () {
        $.HSCore.components.HSChartJS.init($(this));
    });

    var updatingChart = $.HSCore.components.HSChartJS.init($('#updatingData'));
</script>

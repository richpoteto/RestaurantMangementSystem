@extends('layouts.admin.app')

@section('title', __('messages.add_new_restaurant'))

@push('css_or_js')
    <style>
        #map {
            height: 350px;
        }

        @media only screen and (max-width: 768px) {

            /* For mobile phones: */
            #map {
                height: 200px;
            }
        }

    </style>
@endpush

@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">{{__('messages.dashboard')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('admin.vendor.list')}}">{{__('messages.kitchens')}}</a></li>
                    <li class="breadcrumb-item" aria-current="page">{{__('messages.add')}} {{__('messages.kitchen')}}</li>
                </ol>
            </nav>
        </div>
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col-sm mb-2 mb-sm-0">
                    <h1 class="page-header-title"><i class="tio-filter-list"></i>{{ __('messages.add') }} {{ __('messages.kitchen') }}</h1>
                </div>
            </div>
        </div>
        <!-- End Page Header -->
        <div class="row gx-2 gx-lg-3">
            <div class="col-sm-12 col-lg-12 mb-3 mb-lg-2">

                <form action="{{ route('admin.vendor.store') }}" method="post" enctype="multipart/form-data"
                    class="js-validate">
                    @csrf
                    <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.kitchen') }}
                        {{ __('messages.info') }}</small>
                    <br>
                    <div class="row">
                        <div class="col-md-6 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">{{ __('messages.kitchen') }} {{ __('messages.type') }}<span
                                        class="input-label-secondary">*</span></label>
                                <select name="business_id" class="form-control js-select2-custom">
                                    <option value="">---{{ __('messages.select') }}---</option>
                                    @foreach ($businesses as $business)
                                        <option value="{{ $business['id'] }}">{{ $business['business_name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-6">
                            <div class="form-group">
                                <label class="input-label"
                                    for="exampleFormControlSelect1">{{ __('messages.cuisine') }}<span
                                        class="input-label-secondary">*</span></label>
                                <select name="cuisine_id" class="form-control js-select2-custom">
                                    <option value="">---{{ __('messages.select') }}---</option>
                                    @foreach ($cuisines as $cuisine)
                                        <option value="{{ $cuisine['id'] }}">{{ $cuisine['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label class="input-label" for="name">{{ __('messages.restaurant') }}
                                    {{ __('messages.name') }}</label>
                                <input type="text" name="name" class="form-control"
                                    placeholder="{{ __('messages.first') }} {{ __('messages.name') }}"
                                    value="{{ old('name') }}" required>
                            </div>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3">
                            <div class="form-group">
                                <label class="input-label" for="tax">{{ __('messages.vat/tax') }} (%)</label>
                                <input type="number" name="tax" class="form-control"
                                    placeholder="{{ __('messages.vat/tax') }}" min="0" step=".01" required
                                    value="{{ old('tax') }}">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 48px;">
                        <div class="col-md-6 col-lg-6 col-sm-12">
                            <div class="form-group">
                                <label class="input-label" for="address">{{ __('messages.restaurant') }}
                                    {{ __('messages.address') }}</label>
                                <textarea type="text" name="address" class="form-control"
                                    placeholder="{{ __('messages.restaurant') }} {{ __('messages.address') }}"
                                    required>{{ old('address') }}</textarea>
                            </div>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="minimum_delivery_time">{{ __('messages.minimum_delivery_time') }}</label>
                                <input type="text" name="minimum_delivery_time" class="form-control" placeholder="30"
                                    pattern="^[0-9]{2}$" required value="{{ old('minimum_delivery_time') }}">
                            </div>

                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-12">
                            <div class="form-group">
                                <label class="input-label"
                                    for="maximum_delivery_time">{{ __('messages.maximum_delivery_time') }}</label>
                                <input type="text" name="maximum_delivery_time" class="form-control" placeholder="40"
                                    pattern="[0-9]{2}" required value="{{ old('maximum_delivery_time') }}">
                            </div>
                        </div>
                    </div>
                    
                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-6">
                            <center>
                                <img style="width: 320px; height: 220px;border: 1px solid; border-radius: 10px; object-fit:cover;"
                                    id="coverImageViewer" src="{{ asset('public/assets/admin/img/900x400/img1.jpg') }}"
                                    alt="Product thumbnail" />
                            </center>
                            <div class="form-group pt-2" style="margin-top: 24px;">
                                <label for="name">{{ __('messages.upload') }} {{ __('messages.cover') }}
                                    {{ __('messages.photo') }} <span
                                        class="text-danger">({{ __('messages.ratio') }}
                                        2:1)</span></label>
                                <div class="custom-file">
                                    <input type="file" name="cover_photo" id="coverImageUpload" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                    <label class="custom-file-label" for="coverImageUpload">{{ __('messages.choose') }}
                                        {{ __('messages.file') }}</label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <center>
                                <img style="width: 300px; height: 220px;border: 1px solid; border-radius: 10px;" id="logoImageViewer"
                                    src="{{ asset('public/assets/admin/img/400x400/img2.jpg') }}"
                                    alt="delivery-man image" />
                            </center>

                            <div class="form-group pt-2" style="margin-top: 24px;">
                                <label class="input-label">{{ __('messages.restaurant') }}
                                    {{ __('messages.logo') }}<small style="color: red"> (
                                        {{ __('messages.ratio') }} 1:1
                                        )</small></label>
                                <div class="custom-file">
                                    <input type="file" name="logo" id="logoImageUpload" class="custom-file-input"
                                        accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*" required>
                                    <label class="custom-file-label" for="logoImageUpload">{{ __('messages.choose') }}
                                        {{ __('messages.file') }}</label>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="choice_zones">{{ __('messages.zone') }}<span
                                        class="input-label-secondary"
                                        title="{{ __('messages.select_zone_for_map') }}"><img
                                            src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.select_zone_for_map') }}"></span></label>
                                <select name="zone_id" id="choice_zones" required class="form-control js-select2-custom"
                                    data-placeholder="{{ __('messages.select') }} {{ __('messages.zone') }}">
                                    <option value="" selected disabled>{{ __('messages.select') }}
                                        {{ __('messages.zone') }}</option>
                                    @foreach (\App\Models\Zone::all() as $zone)
                                        @if (isset(auth('admin')->user()->zone_id))
                                            @if (auth('admin')->user()->zone_id == $zone->id)
                                                <option value="{{ $zone->id }}" selected>{{ $zone->name }}
                                                </option>
                                            @endif
                                        @else
                                            <option value="{{ $zone->id }}">{{ $zone->name }}</option>
                                        @endif
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="latitude">{{ __('messages.latitude') }}<span
                                        class="input-label-secondary"
                                        title="{{ __('messages.restaurant_lat_lng_warning') }}"><img
                                            src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.restaurant_lat_lng_warning') }}"></span></label>
                                <input type="text" id="latitude" name="latitude" class="form-control"
                                    placeholder="Ex : -94.22213" value="{{ old('latitude') }}" required readonly>
                            </div>


                        </div>
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="longitude">{{ __('messages.longitude') }}<span
                                        class="input-label-secondary"
                                        title="{{ __('messages.restaurant_lat_lng_warning') }}"><img
                                            src="{{ asset('/public/assets/admin/img/info-circle.svg') }}"
                                            alt="{{ __('messages.restaurant_lat_lng_warning') }}"></span></label>
                                <input type="text" name="longitude" class="form-control" placeholder="Ex : 103.344322"
                                    id="longitude" value="{{ old('longitude') }}" required readonly>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-12 col-12" style="margin-top: 24px;">
                        <input id="pac-input" class="controls rounded" style="height: 3em;width:fit-content;" title="{{__('messages.search_your_location_here')}}" type="text" placeholder="{{__('messages.search_here')}}"/>
                        <div id="map"></div>
                    </div>

                    <br>
                    <small class="nav-subtitle text-secondary border-bottom">{{ __('messages.chef') }}
                        {{ __('messages.info') }}</small>

                    <br>
                    <div class="col-md-6" style="margin-top: 18px;">
                        <img style="width: 240px; height: 240px;border: 1px solid; border-radius: 50%; object-fit:cover;"
                                id="chefImageViewer" src="{{ asset('public/assets/admin/img/900x400/img1.jpg') }}"
                                alt="Product thumbnail" />
                        <div class="form-group pt-2" style="margin-top: 24px;">
                            <label for="name">{{ __('messages.upload') }} {{ __('messages.chef') }}
                                {{ __('messages.photo') }}</label>
                            <div class="custom-file">
                                <input type="file" name="chef_image" id="chefImageUpload" class="custom-file-input"
                                    accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                <label class="custom-file-label" for="chefImageUpload">{{ __('messages.choose') }}
                                    {{ __('messages.file') }}</label>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="f_name">{{ __('messages.first') }}
                                    {{ __('messages.name') }}</label>
                                <input type="text" name="f_name" class="form-control"
                                    placeholder="{{ __('messages.first') }} {{ __('messages.name') }}"
                                    value="{{ old('f_name') }}" required>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="l_name">{{ __('messages.last') }}
                                    {{ __('messages.name') }}</label>
                                <input type="text" name="l_name" class="form-control"
                                    placeholder="{{ __('messages.last') }} {{ __('messages.name') }}"
                                    value="{{ old('l_name') }}" required>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="phone">{{ __('messages.phone') }}</label>
                                <input type="text" name="phone" class="form-control" placeholder="Ex : 017********"
                                    value="{{ old('phone') }}" required>
                            </div>
                        </div>
                    </div>
                    <br>

                    <small class="nav-subtitle border-bottom text-secondary">{{ __('messages.login') }}
                        {{ __('messages.info') }}</small>

                    <div class="row" style="padding-top: 12px;">
                        <div class="col-md-4 col-12">
                            <div class="form-group">
                                <label class="input-label" for="email">{{ __('messages.email') }}</label>
                                <input type="email" name="email" class="form-control" placeholder="Ex : ex@example.com"
                                    value="{{ old('email') }}" required>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="js-form-message form-group">
                                <label class="input-label"
                                    for="signupSrPassword">{{ __('messages.password') }}</label>

                                <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control" name="password"
                                        id="signupSrPassword"
                                        placeholder="{{ __('messages.password_length_placeholder', ['length' => '5+']) }}"
                                        aria-label="{{ __('messages.password_length_placeholder', ['length' => '5+']) }}"
                                        required data-msg="Your password is invalid. Please try again."
                                        data-hs-toggle-password-options='{
                                            "target": [".js-toggle-password-target-1", ".js-toggle-password-target-2"],
                                            "defaultClass": "tio-hidden-outlined",
                                            "showClass": "tio-visible-outlined",
                                            "classChangeTarget": ".js-toggle-passowrd-show-icon-1"
                                        }'>
                                    <div class="js-toggle-password-target-1 input-group-append">
                                        <a class="input-group-text" href="javascript:;">
                                            <i class="js-toggle-passowrd-show-icon-1 tio-visible-outlined"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-12">
                            <div class="js-form-message form-group">
                                <label class="input-label"
                                    for="signupSrConfirmPassword">{{ __('messages.confirm_password') }}</label>

                                <div class="input-group input-group-merge">
                                    <input type="password" class="js-toggle-password form-control" name="confirmPassword"
                                        id="signupSrConfirmPassword"
                                        placeholder="{{ __('messages.password_length_placeholder', ['length' => '5+']) }}"
                                        aria-label="{{ __('messages.password_length_placeholder', ['length' => '5+']) }}"
                                        required data-msg="Password does not match the confirm password."
                                        data-hs-toggle-password-options='{
                                            "target": [".js-toggle-password-target-1", ".js-toggle-password-target-2"],
                                            "defaultClass": "tio-hidden-outlined",
                                            "showClass": "tio-visible-outlined",
                                            "classChangeTarget": ".js-toggle-passowrd-show-icon-2"
                                        }'>
                                    <div class="js-toggle-password-target-2 input-group-append">
                                        <a class="input-group-text" href="javascript:;">
                                            <i class="js-toggle-passowrd-show-icon-2 tio-visible-outlined"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">{{ __('messages.submit') }}</button>

                </form>

            </div>
        </div>
    </div>

@endsection

@push('script_2')
    <script>
        $(document).on('ready', function() {
            @if (isset(auth('admin')->user()->zone_id))
            $('#choice_zones').trigger('change');
            @endif
            // INITIALIZATION OF SHOW PASSWORD
            // =======================================================
            $('.js-toggle-password').each(function() {
                new HSTogglePassword(this).init()
            });


            // INITIALIZATION OF FORM VALIDATION
            // =======================================================
            $('.js-validate').each(function() {
                $.HSCore.components.HSValidation.init($(this), {
                    rules: {
                        confirmPassword: {
                            equalTo: '#signupSrPassword'
                        }
                    }
                });
            });
        });
    </script>
    <script>
        function readURL(input, viewer) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                    $('#' + viewer).attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#logoImageUpload").change(function() {
            readURL(this, 'logoImageViewer');
        });

        $("#coverImageUpload").change(function() {
            readURL(this, 'coverImageViewer');
        });
        $("#chefImageUpload").change(function() {
            readURL(this, 'chefImageViewer');
        });
    </script>

    <script src="{{ asset('public/assets/admin/js/spartan-multi-image-picker.js') }}"></script>
    <script type="text/javascript">
        $(function() {
            $("#coba").spartanMultiImagePicker({
                fieldName: 'identity_image[]',
                maxCount: 5,
                rowHeight: '120px',
                groupClassName: 'col-lg-2 col-md-4 col-sm-4 col-6',
                maxFileSize: '',
                placeholderImage: {
                    image: '{{ asset('public/assets/admin/img/400x400/img2.jpg') }}',
                    width: '100%'
                },
                dropFileLabel: "Drop Here",
                onAddRow: function(index, file) {

                },
                onRenderedPreview: function(index) {

                },
                onRemoveRow: function(index) {

                },
                onExtensionErr: function(index, file) {
                    toastr.error('{{ __('messages.please_only_input_png_or_jpg_type_file') }}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                },
                onSizeErr: function(index, file) {
                    toastr.error('{{ __('messages.file_size_too_big') }}', {
                        CloseButton: true,
                        ProgressBar: true
                    });
                }
            });
        });
    </script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key={{ \App\Models\BusinessSetting::where('key', 'map_api_key')->first()->value }}&libraries=drawing,places&callback=initMap&v=3.45.8">
    </script>
    <script>
        @php($default_location = \App\Models\BusinessSetting::where('key', 'default_location')->first())
        @php($default_location = $default_location->value ? json_decode($default_location->value, true) : 0)
        let myLatlng = {
            lat: {{ $default_location ? $default_location['lat'] : '23.757989' }},
            lng: {{ $default_location ? $default_location['lng'] : '90.360587' }}
        };
        let map = new google.maps.Map(document.getElementById("map"), {
            zoom: 13,
            center: myLatlng,
        });
        var zonePolygon = null;
        let infoWindow = new google.maps.InfoWindow({
            content: "Click the map to get Lat/Lng!",
            position: myLatlng,
        });
        var bounds = new google.maps.LatLngBounds();

        function initMap() {
            // Create the initial InfoWindow.
            infoWindow.open(map);
            //get current location block
            infoWindow = new google.maps.InfoWindow();
            // Try HTML5 geolocation.
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    (position) => {
                        myLatlng = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude,
                        };
                        infoWindow.setPosition(myLatlng);
                        infoWindow.setContent("Location found.");
                        infoWindow.open(map);
                        map.setCenter(myLatlng);
                    },
                    () => {
                        handleLocationError(true, infoWindow, map.getCenter());
                    }
                );
            } else {
                // Browser doesn't support Geolocation
                handleLocationError(false, infoWindow, map.getCenter());
            }
            //-----end block------
            // Create the search box and link it to the UI element.
            const input = document.getElementById("pac-input");
            const searchBox = new google.maps.places.SearchBox(input);
            map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);
            let markers = [];
            searchBox.addListener("places_changed", () => {
                const places = searchBox.getPlaces();

                if (places.length == 0) {
                return;
                }
                // Clear out the old markers.
                markers.forEach((marker) => {
                marker.setMap(null);
                });
                markers = [];
                // For each place, get the icon, name and location.
                const bounds = new google.maps.LatLngBounds();
                places.forEach((place) => {
                if (!place.geometry || !place.geometry.location) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                const icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25),
                };
                // Create a marker for each place.
                markers.push(
                    new google.maps.Marker({
                    map,
                    icon,
                    title: place.name,
                    position: place.geometry.location,
                    })
                );

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
                });
                map.fitBounds(bounds);
            });
        }
        initMap();

        function handleLocationError(browserHasGeolocation, infoWindow, pos) {
            infoWindow.setPosition(pos);
            infoWindow.setContent(
                browserHasGeolocation ?
                "Error: The Geolocation service failed." :
                "Error: Your browser doesn't support geolocation."
            );
            infoWindow.open(map);
        }
        $('#choice_zones').on('change', function() {
            var id = $(this).val();
            $.get({
                url: '{{ url('/') }}/admin/zone/get-coordinates/' + id,
                dataType: 'json',
                success: function(data) {
                    if (zonePolygon) {
                        zonePolygon.setMap(null);
                    }
                    zonePolygon = new google.maps.Polygon({
                        paths: data.coordinates,
                        strokeColor: "#FF0000",
                        strokeOpacity: 0.8,
                        strokeWeight: 2,
                        fillColor: 'white',
                        fillOpacity: 0,
                    });
                    zonePolygon.setMap(map);
                    zonePolygon.getPaths().forEach(function(path) {
                        path.forEach(function(latlng) {
                            bounds.extend(latlng);
                            map.fitBounds(bounds);
                        });
                    });
                    map.setCenter(data.center);
                    google.maps.event.addListener(zonePolygon, 'click', function(mapsMouseEvent) {
                        infoWindow.close();
                        // Create a new InfoWindow.
                        infoWindow = new google.maps.InfoWindow({
                            position: mapsMouseEvent.latLng,
                            content: JSON.stringify(mapsMouseEvent.latLng.toJSON(),
                                null, 2),
                        });
                        var coordinates = JSON.stringify(mapsMouseEvent.latLng.toJSON(), null,
                            2);
                        var coordinates = JSON.parse(coordinates);

                        document.getElementById('latitude').value = coordinates['lat'];
                        document.getElementById('longitude').value = coordinates['lng'];
                        infoWindow.open(map);
                    });
                },
            });
        });
    </script>
@endpush

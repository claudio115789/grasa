function GoogleMap(locations, centralize, zoom) {
    this.init(locations, centralize, zoom);
}
GoogleMap.prototype = {
    init: function (locations, centralize, zoom) {

        if (typeof zoom === "undefined") {
            zoom = 13;
        }

        if (!(locations instanceof Array))
            this.locations = [locations];
        else
            this.locations = locations;

        this.delay = 100;

        if (locations.length == 1) {
            centralize = this.cordenate(locations[0].lat, locations[0].lgn);
            zoom = 16;
        } else {
            centralize = this.cordenate(centralize.lat(), centralize.lng());
        }

        this.options = {
            zoom: zoom,
            center: centralize,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }

        this.geocoder = new google.maps.Geocoder();

        var map = new google.maps.Map(document.getElementById("map"), this.options);

        this.map = map;

        this.map.set('styles', [
                {
                    "featureType": "all",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "all",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "all",
                    "elementType": "geometry.fill",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "all",
                    "elementType": "labels",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "all",
                    "elementType": "labels.text",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "administrative",
                    "elementType": "labels.text.fill",
                    "stylers": [
                        {
                            "color": "#444444"
                        }
                    ]
                },
                {
                    "featureType": "administrative.country",
                    "elementType": "geometry.fill",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        },
                        {
                            "hue": "#ff0000"
                        }
                    ]
                },
                {
                    "featureType": "administrative.country",
                    "elementType": "geometry.stroke",
                    "stylers": [
                        {
                            "hue": "#ff0000"
                        }
                    ]
                },
                {
                    "featureType": "administrative.country",
                    "elementType": "labels.text.stroke",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "weight": "2.36"
                        },
                        {
                            "color": "#fefefe"
                        },
                        {
                            "gamma": "1.57"
                        }
                    ]
                },
                {
                    "featureType": "landscape",
                    "elementType": "all",
                    "stylers": [
                        {
                            "color": "#f2f2f2"
                        }
                    ]
                },
                {
                    "featureType": "poi",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        },
                        {
                            "color": "#686869"
                        },
                        {
                            "lightness": "80"
                        },
                        {
                            "saturation": "-25"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "geometry.fill",
                    "stylers": [
                        {
                            "color": "#929292"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "labels.text",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "labels.text.fill",
                    "stylers": [
                        {
                            "color": "#000000"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "labels.text.stroke",
                    "stylers": [
                        {
                            "color": "#faf6f6"
                        },
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.attraction",
                    "elementType": "labels.icon",
                    "stylers": [
                        {
                            "hue": "#0091ff"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "geometry",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "color": "#c9c7c7"
                        },
                        {
                            "saturation": "-25"
                        },
                        {
                            "lightness": "42"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "labels.text",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "labels.text.fill",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "color": "#050000"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "labels.text.stroke",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "color": "#fdfcfc"
                        }
                    ]
                },
                {
                    "featureType": "poi.business",
                    "elementType": "labels.icon",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "hue": "#0058ff"
                        },
                        {
                            "saturation": "34"
                        },
                        {
                            "lightness": "0"
                        }
                    ]
                },
                {
                    "featureType": "poi.government",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.medical",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.park",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "poi.place_of_worship",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "poi.school",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "poi.sports_complex",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "road",
                    "elementType": "all",
                    "stylers": [
                        {
                            "saturation": -100
                        },
                        {
                            "lightness": 45
                        },
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "road.highway",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "road.arterial",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "road.arterial",
                    "elementType": "labels.icon",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "road.local",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "simplified"
                        }
                    ]
                },
                {
                    "featureType": "transit",
                    "elementType": "all",
                    "stylers": [
                        {
                            "visibility": "off"
                        }
                    ]
                },
                {
                    "featureType": "water",
                    "elementType": "all",
                    "stylers": [
                        {
                            "color": "#7EB7E2"
                        },
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "water",
                    "elementType": "labels.text",
                    "stylers": [
                        {
                            "visibility": "on"
                        }
                    ]
                },
                {
                    "featureType": "water",
                    "elementType": "labels.text.stroke",
                    "stylers": [
                        {
                            "visibility": "on"
                        },
                        {
                            "color": "#ffffff"
                        }
                    ]
                }
            ]
        );

        this.bounds = new google.maps.LatLngBounds();

        this.markMap();
    },

    cordenate: function (lat, lng) {
        return new google.maps.LatLng(lat, lng);
    },

    mark: function (desc, cordanate) {
        var marker = new google.maps.Marker({
            position: cordanate,
            map: this.map,
            icon: '/assets/site/img/map/mark.png'
        });

        google.maps.event.addListener(marker, 'click', function () {
            console.log('x');
        });

        this.bounds.extend(marker.position);
    },

    markMap: function () {
        this.locations.forEach($.proxy(function (location) {
            setTimeout($.proxy(function () {
                this.write(location);
            }, this), this.delay);
        }, this));
    },
    write: function (record) {
        var map = this.map
        var bounds = this.bounds;
        if (record.info.type == 'prime')
            var path = '/assets/site/img/map/mark-prime.png';
        else
            var path = '/assets/site/img/map/mark-default2.png';

        var markerIcon = new google.maps.MarkerImage(path,
            new google.maps.Size(25, 29),
            new google.maps.Point(0, 0),
            new google.maps.Point(0, 29));
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(record.lat, record.lgn),
            map: map,
            icon: markerIcon
        });
        var data = record.info;
        console.log(data.phone ==  null);
        if (data.type == 'prime' && data.link+'/' != appBaseUrl)
            var button = '<a href="' + data.link + '" class="btn btn_blue trans3 m_t_10 t_center"><i class="mdi mdi-bank"></i> Ver perfil</a>';
        else
            var button = '';

        var infowindow = new google.maps.InfoWindow({
            content: '<div id="map-info-content" ><div class="img">' +
            '<img src="' + data.logo + '"></div><div class="text">' +
            '<h3>' + isNull(data.name) + '</h3>' +
            '<p>' + isNull(data.areas) + '</p><hr>' +
            '<p>' + isNull(data.phone, "Telefone: {data}") + '</p>' +
            '<p>' + isNull(data.address) + '</p><p>' + isNull(data.city) + '/' + isNull(data.state) + ' - CEP: ' + isNull(data.postal_code) + '</p>' +
            button +
            '</div>'
        });

        if(!data.dontShow)
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(this.map, marker);
            });

        bounds.extend(marker.position);
    },
};

function isNull(str, replace) {
    if (replace == undefined) replace = "{data}";
    if (str == null)
        return '';
    return replace.replace('{data}', str);
}

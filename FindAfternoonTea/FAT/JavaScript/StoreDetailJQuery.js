var map;
var geocoder;
var marker;
var position;

function storeService() {
    this.getStoreDetails = function (row,onSuccess) {
        $.ajax({
            type: "GET",
            url: "http://localhost:52289/WebServices/StoreService.svc/getStoreDetails?rows="+row,
           // url: "http://iweb.csie.ntut.edu.tw:9080/Final38/WebServices/CompanyService.svc/getCompany",
            dataType: "json",
            success: onSuccess
        });
    }
}

window.onload = function () {

    position = new google.maps.LatLng(25.0419, 121.5353);

    var mapOptions = {
        zoom: 18,
        center: position,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        zoomControl: false,
        mapTypeControl: false,
        streetViewControl: true,
        draggable:true
    };
    map = new google.maps.Map($("#map")[0], mapOptions);

    geocoder = new google.maps.Geocoder();

    var markerOptions = {
        map: map,
        position: position,
        draggable: false
    };
    marker = new google.maps.Marker(markerOptions);
    codeAddress();

    var services = new storeService();
    services.getStoreDetails(2, showdata);
}
function showdata(data) {
    alert(data.d.name);
}
function codeAddress() {

    var address = "台北市" + $("#FormView1_districtNameLabel").text() + $("#FormView1_addressLabel").text();
    var request = {
        'address': address
    };

    if (address != "") {
        if (address.match(/^[a-zA-Z]+$/)) {
            alert("請輸入中文地名!")
        }
        else {
            geocoder.geocode(request, showMarker);
        }
    }
}

function showMarker(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        position = results[0].geometry.location;

        map.setCenter(position);
        marker.setPosition(position);
    }
    else {
        alert('無效地址!');
    }
}
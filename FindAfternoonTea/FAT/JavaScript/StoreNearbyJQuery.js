var map;
var geocoder;
var homeMarker;
var position;
var addrs,ids,names,prices,phones,opens,closes,pics;

window.onload = function () {
    var addrHide = $("#addressHiddenField").val();
    var idHide = $("#storeIdHiddenField").val();
    var nameHide = $("#nameHiddenField").val();
    var priceHide = $("#priceHiddenField").val();
    var phoneHide = $("#phoneHiddenField").val();
    var openHide = $("#openHiddenField").val();
    var closeHide = $("#closeHiddenField").val();
    var picHide = $("#picHiddenField").val();
    addrs = addrHide.split(';');
    ids = idHide.split(';');
    names = nameHide.split(';');
    prices = priceHide.split(';');
    phones = phoneHide.split(';');
    opens = openHide.split(';');
    closes = closeHide.split(';');
    pics = picHide.split(';');
    
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(success);
    } else {
        error('Geo Location is not supported');
    }
}
function success(position) {
    position = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

    var mapOptions = {
        zoom: 15,
        center: position,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        panControl: false,
        zoomControl: false,
        mapTypeControl: false,
        streetViewControl: false,
        draggable: true
    };
    map = new google.maps.Map($("#map")[0], mapOptions);

    geocoder = new google.maps.Geocoder();

    var icon = {
        //url: 'http://localhost:52289/FAT/pic/selfIcon.png',
        url: 'http://iweb.csie.ntut.edu.tw:9080/Final38/FAT/pic/selfIcon.png',
        anchor: new google.maps.Point(16, 15)
    };
    var homeMarkerOptions = {
        map: map,
        icon:icon,
        position: position,
        draggable: false,
        animation: google.maps.Animation.DROP,
    };
    homeMarker = new google.maps.Marker(homeMarkerOptions);
    showStore();
}

function showStore() {
    for (var i = 0; i < addrs.length - 1; i++) {
        codeAddress(addrs[i], ids[i], names[i], prices[i], phones[i], opens[i], closes[i], pics[i]);
    }
}

function codeAddress(address, id, name, price, phone, open, close, pic) {
    if (close == '') close = "無";
    var request = {
        'address': address
    };
    if (address != "") {
        if (address.match(/^[a-zA-Z]+$/)) {
            alert("請輸入中文地名!")
        }
        else {
            geocoder.geocode(request, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    position = results[0].geometry.location;
                    var icon = {
                       // url: 'http://localhost:52289/FAT/pic/storeIcon.png',
                        url: 'http://iweb.csie.ntut.edu.tw:9080/Final38/FAT/pic/storeIcon.png',
                        anchor: new google.maps.Point(1, 5)
                    };
                    var storeMarkerOptions = {
                        map: map,
                        icon: icon,
                        draggable: false,
                        visible: true,
                        position: position,
                        animation: google.maps.Animation.DROP,
                    };
                    var storeMarker = new google.maps.Marker(storeMarkerOptions);
                    storeMarker.setValues({
                        storeId: id,
                        storeName: name,
                        storePrice: price,
                        storePhone: phone,
                        storeOpen: open,
                        storeClose: close,
                        storePic: pic,
                        storeAddress:address
                    });

                    google.maps.event.addListener(storeMarker, 'click', function () {
                        var contentString = $('<div class="marker-info-win">' +
		                '<div class="marker-inner-win"><span class="info-content">' +
                        '<a style="text-decoration:none;color:#000000;" href="StoreDetails.aspx?storeID=' + this.storeId + '">' +
		                '<h1 class="marker-heading"><img src="'+this.storePic+'" width="53px" height="40px">' + this.storeName + '</h1></a>' +
		                '地址: ' + this.storeAddress + '<br>' +
                        '電話: ' + this.storePhone + '<br>' +
                        '價格: ' + this.storePrice + '<br>' +
                        '營業時間: ' + this.storeOpen + '<br>' +
                        '公休日: ' + this.storeClose + '<br>' +
		                '</span></div></div>');
                        var infowindow = new google.maps.InfoWindow();
                        infowindow.setContent(contentString[0]);
                        infowindow.open(map, this);
                    });
                }
            });
        }
    }
}

function showMarker(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
        position = results[0].geometry.location;
        var icon = {
            //url: 'http://localhost:52289/FAT/pic/storeIcon.png',
            url: 'http://iweb.csie.ntut.edu.tw:9080/Final38/FAT/pic/storeIcon.png',
            anchor: new google.maps.Point(1, 5)
        };
        var storeMarkerOptions = {
            map: map,
            icon: icon,
            draggable: false,
            visible: true,
            position: position,
            animation: google.maps.Animation.DROP,
        };
        var storeMarker = new google.maps.Marker(storeMarkerOptions);
    }
}

var map;
var markers = [];
var infoWindow;
var locationSelect;


$(document).ready(function(){

  map = new google.maps.Map(document.getElementById("map"), {
    center: new google.maps.LatLng(-26, 134),
    zoom: 4,
    mapTypeId: 'roadmap',
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    }
  });
  infoWindow = new google.maps.InfoWindow();

  locationSelect = document.getElementById("locationSelect");
  locationSelect.onchange = function() {
    var markerNum = locationSelect.options[locationSelect.selectedIndex].value;
    if (markerNum != "none") {
      google.maps.event.trigger(markers[markerNum], 'click');
    }
  };
  
  $('#searchButton').click(function(){
    var address = document.getElementById("addressInput").value + ", australia";
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode({
      address: address
    },
    function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        searchLocationsNear(results[0].geometry.location);
      } else {
        alert(address + ' not found');
      }
    });
  });
});

function clearLocations() {
  infoWindow.close();
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers.length = 0;

  locationSelect.innerHTML = "";
  var option = document.createElement("option");
  option.value = "none";
  option.innerHTML = "See all results:";
  locationSelect.appendChild(option);
}



function searchLocationsNear(center) {
  clearLocations();
  var radius = document.getElementById('radiusSelect').value;
  var product = document.getElementById('productSelect').value;
//  var searchUrl = 'http://mcwstorefinder.com:3000/stores.json?lat=' + center.lat() + '&lng=' + center.lng() + '&distance=' + radius + '&callback=?';
  var searchUrl = '/stores.json?lat=' + center.lat() + '&lng=' + center.lng() + '&product=' + product + '&distance=' + radius + '&callback=?';
  var bounds = new google.maps.LatLngBounds();
  $.getJSON(searchUrl, null, function(stores) {
    var noResults = true;
    for (i in stores) {
      noResults = false;
      store = stores[i];
      var name = store.name;
      var address = store.address;
      var distance = parseFloat(store.distance);
      var latlng = new google.maps.LatLng(parseFloat(store.lat), parseFloat(store.lng));
      createOption(name, distance, i);
      createMarker(latlng, name, address);
      bounds.extend(latlng);
    }
    if (noResults) {
      var sw = new google.maps.LatLng(
      parseFloat(center.lat() - 0.1), parseFloat(center.lng()) - 0.1);
      var ne = new google.maps.LatLng(
      parseFloat(center.lat() + 0.1), parseFloat(center.lng() + 0.1));
      bounds.extend(sw);
      bounds.extend(ne);
    }
    map.fitBounds(bounds);
    locationSelect.style.visibility = "visible";
    locationSelect.onchange = function() {
      var markerNum = locationSelect.options[locationSelect.selectedIndex].value;
      google.maps.event.trigger(markers[markerNum], 'click');
    };
    if (noResults) {
      alert('No stores could be found. Try broadening your search');
    }
  });
}

function createMarker(latlng, name, address) {
  var html = "<b>" + name + "</b> <br/>" + address;
  var marker = new google.maps.Marker({
    map: map,
    position: latlng
  });
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(html);
    infoWindow.open(map, marker);
  });
  markers.push(marker);
}

function createOption(name, distance, num) {
  var option = document.createElement("option");
  option.value = num;
  option.innerHTML = name + "(" + distance.toFixed(1) + ")";
  locationSelect.appendChild(option);
}


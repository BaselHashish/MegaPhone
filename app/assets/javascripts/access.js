// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
function askNav(){
  x = document.getElementById("lat");
  y = document.getElementById("lon");
  function getLocation() {
      if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(showPosition);
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  }
  function showPosition(position) {
    var lat = Math.round(position.coords.latitude*100)/100;
    var lon = Math.round(position.coords.longitude*100)/100;
    x.value = lat;
    y.value = lon;

  }
  getLocation();
}
if (top.location.pathname === '/access/login') {
  askNav();
}

});
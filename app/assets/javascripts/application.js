// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap.min
//= require jquery.easing.min
//= require jquery.waypoints.min
//= require_tree .
var myMessages = ['error','success'];
function hideAllMessages() {
         var messagesHeights = new Array(); // this array will store height for each

         for (i=0; i<myMessages.length; i++) {
          messagesHeights[i] = $('.' + myMessages[i]).outerHeight(); // fill array
          $('.' + myMessages[i]).css('top', -messagesHeights[i]); //move element outside viewport
         }
}
function showMessage(type) {
    $('.'+ type +'-trigger').click(function(){
          hideAllMessages();
          $('.'+type).animate({top:"0"}, 500);
    });
}
$(document).ready(function(){

     // Initially, hide them all
     //hideAllMessages();

     // Show message
     for(var i=0;i<myMessages.length;i++)
     {
        showMessage(myMessages[i]);
        setTimeout(function() {
          $('.message').animate({top: -$('.message').outerHeight()}, 500);
        }, 2000);
     }

     // When message is clicked, hide it
     $('.message').click(function(){
              $(this).animate({top: -$(this).outerHeight()}, 500);
      });

});
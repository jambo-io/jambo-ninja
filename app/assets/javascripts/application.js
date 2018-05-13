// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require popper
//= require parallax
//= require bootstrap-sprockets
//= require social-share-button
//= require gmaps
//= require_tree .

var page = $("html, body");


function slide(section){


    page.on("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove", function(){
        page.stop();
    });

    page.animate({scrollTop: $(section).position().top }, 2000, function(){
        page.off("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove");
    });
    return false;

}

$(function () {
    $('[data-toggle="popover"]').popover()
})




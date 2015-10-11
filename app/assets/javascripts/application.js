// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require jquery.validate
//= require jquery.ime
//= require jquery.ime.selector
//= require jquery.ime.preferences
//= require jquery.ime.inputmethods
//= require SearchHighlight
//= require_tree .


$( document ).ready( function () {
    $( '#search-word' ).ime();

    $("#main_search").validate({
        rules:{

            "poem":
            {
                required: true,
                minlength: 2,
                maxlength: 50
            }

        },
        messages:{
            "poem":
            {
                required: "ದಯವಿಟ್ಟು ಪದವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ",
                minlength: "ಕನಿಷ್ಟ 2 ಅಕ್ಷರವನ್ನು ಬೆರಳಚ್ಚು ಮಾಡಿ",
                maxlength: "ಪದ 50 ಅಕ್ಷರವನ್ನು ಮೀರಿದೆ"
            }
        },
        errorElement: "div",
        wrapper: "div",  // a wrapper around the error message
        errorPlacement: function(error, element) {
            offset = element.offset();
            error.insertBefore(element)
            error.addClass('message');  // add a class to the wrapper
            error.css('position', 'absolute');
            // error.css('left', '28%' );
            // error.css('top', '35%' );
            error.css('left', offset.left + 30); // error.css('left', offset.left + element.outerWidth());
            error.css('top', offset.top  - 25);
            error.css('color', '#D21000' );
        }
        // errorPlacement: function (error, element) {
        // 	alert(error.text());
        // }


    });

});
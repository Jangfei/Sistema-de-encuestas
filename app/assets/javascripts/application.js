// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require fancybox
//= require jquery.ui.all
//= require jquery_ujs
//= require noty/jquery.noty
//= require noty/layouts/top
//= require noty/themes/default
//= require_self

$ = jQuery

$.noty.defaults.timeout = false;
$.noty.defaults.layout = 'top';
$.noty.defaults.closeWith = ['click', 'button']
var notification = null;
function show_notification(notice) {
    if (notification != null) {
        notification.close();
        notification = null;
    }
    notification = noty({
        text : notice
    });
}

//inherit js
var fancybox_options = {
    'scrolling' : 'no',
    'titleShow' : false,
    'showNavArrows' : false,
    'onComplete' : function () { $('a[rel=lightbox]').fancybox(fancybox_options); }
};
var petitionProgress = false;

$(document).ready(function() {
    //Show flash notice
    if ($("#notice").length > 0) {
        show_notification($("#notice").html());
    }
    $('a[rel=lightbox]').fancybox(fancybox_options);

    //prevents backspace go back in browsers
    $(document).unbind('keydown').bind('keydown', function(event) {
        var doPrevent = false;
        if (event.keyCode === 8) {
            var d = event.srcElement || event.target;
            if ((d.tagName.toUpperCase() === 'INPUT' && (d.type.toUpperCase() === 'TEXT' || d.type.toUpperCase() === 'PASSWORD')) || d.tagName.toUpperCase() === 'TEXTAREA') {
                doPrevent = d.readOnly || d.disabled;
            } else {
                doPrevent = true;
            }
        }

        if (doPrevent) {
            event.preventDefault();
        }
    });
    
    
    //Code for cancel buttons
    $("body").delegate(".cancel_button", "click", function() {
        window.location.href = $(event.target).data("url");
    });
    
    $("body").delegate(".remote_cancel_button", "click", function() {
        $.fancybox.close();
    });
    

    //Double submit protection
    $('form.double_submit_protected ').submit(function() {
        // On submit disable its submit button
        $('form.double_submit_protected input[type=submit][disabled]:not(.undisable_submit)').addClass('disabled_submit');
        $('form.double_submit_protected input[type=submit]').attr('disabled', 'disabled');
    });

    $('form.validate_form').validate({
        errorClass : "client_error"
    });
    //update_table_colors();
    setTimeout("$('#wait').hide();", 300);
    jQuery.extend(jQuery.validator.messages, {
        required : "Este dato es obligatorio.",
        remote : "Please fix this field.",
        email : "Please enter a valid email address.",
        url : "Please enter a valid URL.",
        date : "Please enter a valid date.",
        dateISO : "Please enter a valid date (ISO).",
        number : "No es un número.",
        digits : "No es un número.",
        creditcard : "Please enter a valid credit card number.",
        equalTo : "Please enter the same value again.",
        accept : "Please enter a value with a valid extension.",
        maxlength : jQuery.validator.format("Please enter no more than {0} characters."),
        minlength : jQuery.validator.format("Please enter at least {0} characters."),
        rangelength : jQuery.validator.format("Please enter a value between {0} and {1} characters long."),
        range : jQuery.validator.format("Please enter a value between {0} and {1}."),
        max : jQuery.validator.format("<br/>El valor debe ser menor o igual a {0}."),
        min : jQuery.validator.format("<br/> El valor debe ser mayor o igual a {0}.")
    });
    //Breadcrumbs with confirm. Please use the containers class alert_breadcrumb
    $('.alert_breadcrumb a').click(function() {
        return confirm('¿Está seguro de cancelar la operación?. Se descartarán los datos no guardados');
    });

    $('a').each(function() {
        var element = $(this);
        try {
            if (element.onclick == null && element.attr('rel') == 'lightbox') {
                element.click(function(e) {
                    $(e.target).click(do_nothing);
                    setTimeout(function() {
                        $(e.target).unbind('click', do_nothing);
                    }, 1000);
                });
            }
        } catch(err) {
            alert(element.text);
        }

    });

});
//escape function
function do_nothing() {
    return false;
}

function update_table_colors() {
    $('table.azul>tr:nth-child(odd),table.azul>tbody>tr:nth-child(odd)').removeClass('odd').removeClass('even').addClass('odd');
    $('table.azul>tr:nth-child(even), table.azul>tbody>tr:nth-child(even)').removeClass('even').removeClass('odd').addClass('even');
}

function send_get_with_form_params(obj) {
    carter = obj.url
    number = -1
    if (carter.indexOf('?') == number) {
        window.location.href = obj.url + '?' + jQuery.param(obj.form.serializeArray())
    } else {
        window.location.href = obj.url + '&' + jQuery.param(obj.form.serializeArray())
    }

}

/*
 * Resize images: examples
 *
 * $("div.print_student img").resize(80.0);
 * $("div.image img").resize(100.0);
 */
$.fn.resize = function(max_size) {
    var m = Math.ceil;
    if (max_size == undefined) {
        max_size = 200.0;
    }
    $(this).each(function() {
        var h = max_size;
        var w = max_size;
        var image_h = $(this).height();
        var image_w = $(this).width();
        if (image_h > image_w) {
            var w = m(image_w / image_h * max_size);
            $(this).attr('width', w);
        } else {
            var h = m(image_h / image_w * max_size);
            $(this).attr('height', h);
        }
    })
};



function null_link_event(e) {
    e.preventDefault();
    return null;
};











// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
    $("body").delegate("#cancel_button", "click", function() {
        $("a.hidden").trigger("click");    
    });
});

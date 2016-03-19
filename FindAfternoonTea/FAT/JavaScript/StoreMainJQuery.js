$(document).ready(function () {
    var picHide = $("#PicHiddenField").val();
    picPath = picHide.split(';');
    for (var i = 0; i < picPath.length - 1; i++) {
        $("#banner ul").append("<li style='background-image: url(" + picPath[i] + "); background-size:100% 100%;'></li>");
    }
    $('.banner').unslider({
        speed: 500, 
        delay: 2000,
        dots: true,
    });
});


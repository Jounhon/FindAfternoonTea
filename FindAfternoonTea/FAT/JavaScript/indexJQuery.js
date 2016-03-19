$(document).ready(function () {
    ShowTime();
    if (loginProvider == '') $("#info").hide();
    else {
        $("#info").show();
        $("#loginBox").css({ 'top': '35%'});
        $("#loginBox #info").css({ 'background-color': 'rgba(200,200,200,.3)', 'height': '300px','padding-top':'2px' });
        $("#loginBox #info #imgBox").css({ 'margin-top': '50px' });
        $("#loginBox #info p").css({ 'background-color': 'rgba(255,255,255,0.5)' });
        $("#logButton").hide();
        $("#loginBox #info #imgBox").css({ 'background-image': 'url(' + loginUserpic + ')' });
        $("#nameLabel").html("Hello，" + loginUserName + "<br><p style='background-color:rgba(255,255,255,0);margin-top:-32px;font-size:10px;'>3秒後自動換頁</p>");
        setTimeout("goToMain()",3000);
    }
});
function goToMain() {
    location.href = "StoreMain.aspx";
}

function ShowTime() {
    var NowDate = new Date();
    var h = NowDate.getHours();
    var m = NowDate.getMinutes();
    var s = NowDate.getSeconds();
    $("#time").html( h + ' : ' + m + ' : ' + s);
    setTimeout('ShowTime()', 1000);
}
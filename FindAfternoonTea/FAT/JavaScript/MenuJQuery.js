function CompanyService() {
    this.getCompany = function (onSuccess) {
        $.ajax({
            type: "GET",
            //url: " http://localhost:52289/WebServices/CompanyService.svc/getCompany",
            url: "http://iweb.csie.ntut.edu.tw:9080/Final38/WebServices/CompanyService.svc/getCompany",
            dataType: "json",
            success: onSuccess
        });
    }
}

$(document).ready(function () {
    if (UserAuthority == "manager" || UserAuthority == "admin") $("#manageLink").show();
    if (UserAuthority == "admin") $("#authorityLink").show();
    $("#searchButton,#searchText").hide();
    $("#searchText").val("search store").css({ 'color': '#CCCCCC', 'font-style': 'italic' });
    var companyService = new CompanyService();
    companyService.getCompany(showCompanyData);
});
function showCompanyData(companyData) {
    $("#topMenu a img").attr("src", companyData.d.logo);
    $("#aboutInfo .logo img").attr("src", companyData.d.logo);
    $("#aboutInfo .about .name").text("關於" + companyData.d.name);
    $("#aboutInfo .info .name").text("更多" + companyData.d.name+"資訊");
    $("#aboutInfo .about .details").text(companyData.d.about);
    $("#aboutInfo .info .addresss").html('<i class="fa fa-map-marker fa-lg"></i>' + companyData.d.address);
    $("#aboutInfo .info .phone").html('<i class="fa fa-mobile fa-lg"></i>' + companyData.d.phone);
    $("#aboutInfo .info .email").html("<a href='StoreMail.aspx'><i class='fa fa-envelope-o fa-lg'></i>" + companyData.d.mail + "</a>");
}
$(function () {
    $(window).scroll(function () {
        var scrollVal = $(this).scrollTop();
        if (scrollVal > 0) {
            $('#topMenu').css({ 'height': '50px', 'line-height': '50px', 'box-shadow': 'rgba(0,0,0,.3) 0px 8px 5px' });
            $('#topMenu a img').css({ 'height': '50px', 'width': '120px' });
            $('#topMenu ul li').css({ 'line-height': '50px', 'width': '120px' });
            $('#topMenu #search .searchButton').css({ 'margin-top': '15px' });
            $('#topMenu #search .searchText').css({ 'margin-top': '15px' });
            $('#topMenu #search img').css({ 'margin-top': '5px' });
        }
        else {
            $('#topMenu').css({ 'height': '80px', 'line-height': '80px', 'box-shadow': 'none' });
            $('#topMenu a img').css({ 'height': '80px', 'width': '192px' });
            $('#topMenu ul li').css({ 'line-height': '80px', 'width': '120px' });
            $('#topMenu #search .searchButton').css({ 'margin-top': '30px' });
            $('#topMenu #search .searchText').css({ 'margin-top': '30px' });
            $('#topMenu #search img').css({ 'margin-top': '20px' });
        }
    });
    $("#searchText").focus(function () {
        if ($(this).val() == "") {
            $(this).val("search store");
            $(this).css({ 'color': '#CCCCCC', 'font-style': 'italic' });
        }
        else {
            $(this).val("");
            $(this).css({ 'color': '#000000', 'font-style': 'normal' });
        }
    });
    $("#searchIcon").click(function () {
        $("#searchButton,#searchText").toggle(300);
    });
    $("#searchButton").click(function () {
        var searchText = $("#searchText").val();
        if (searchText != "" && searchText != "search store") {
            location.href = "StoreSearch.aspx?searchText=" + searchText;
        }
        return false;
    });
});
function Logout() {
    if (loginProvider == "FB") {
        FBlogout();
    }
    else if (loginProvider == "Google") {
        googleLogout();
    }
}

(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.3&appId=1664394413794863";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

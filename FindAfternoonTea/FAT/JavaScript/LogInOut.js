
function FacebookInit() {
    FB.init({
        appId: '1664394413794863',
        status: true,
        cookie: true
    });
}
function FBlogin() {
    FacebookInit();
    FB.login(function (loginResponse) {
        if (loginResponse.authResponse) {
            FB.api('/me', function (apiResponse) {
                var name = apiResponse.name;
                var id = apiResponse.id;
                var email = apiResponse.email;
                var picture = "https://graph.facebook.com/" + id + "/picture";
                location.href = "index.aspx?name=" + name + "&id=" + id + "&email=" + email + "&pic=" + picture + "&loginProvider=FB";
            });
        }
    }, { scope: 'email' });
}
function FBlogout() {
    FacebookInit();
    FB.getLoginStatus(function (statusResponse) {
        if (statusResponse.status === 'connected') {
            FB.logout(function (response) {
                location.href = "../FATweb/index.aspx?loginProvider=logout";
            })
        }
    })
}
function GoogleLogin() {
    var myParams = {
        'clientid': '979717148049-gvh4sbaik2e8rhc2dkfp0nc2hv82b7f5.apps.googleusercontent.com',
        'cookiepolicy': 'single_host_origin',
        'callback': 'loginCallback',
        'approvalprompt': 'force',
        'scope': 'https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/plus.profile.emails.read'
    };
    gapi.auth.signIn(myParams);
}
function loginCallback(result) {
    if (result['status']['signed_in']) {
        var request = gapi.client.plus.people.get({
            'userId': 'me'
        });
        request.execute(function (resp) {
            var gId = resp['id'];
            var gName = resp['displayName'];
            var gImage = resp['image']['url'];
            var gEmail = resp['emails'][0]['value'];
            location.href = 'index.aspx?id=' + gId + '&name=' + gName + '&email=' + gEmail + '&pic=' + gImage + '&loginProvider=Google';
        });
    }
}
function onLoadCallback() {
    gapi.client.setApiKey('AIzaSyBTAmosKUuCcOKhBxEvr7K2spS0selkDSY');
    gapi.client.load('plus', 'v1', function () { });
}
function googleLogout() {
    gapi.auth.signOut();
    location.href = "../FATweb/index.aspx?loginProvider=logout";
}
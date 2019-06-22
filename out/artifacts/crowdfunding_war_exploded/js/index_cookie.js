var oDefault = document.getElementById("default");
var oLogged = document.getElementById("logged");
var oOut = document.getElementById("outlogin");
var oLoginName = document.getElementById("login-name");
if (getCookie("username")) {
    oDefault.style.display = "none";
    oLogged.style.display = "block";
    oLoginName.innerHTML = getCookie("username");
}
oOut.onclick = function () {
    removeCookie("username");
    window.location.href = "index.html";
}

function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toUTCString();
    } else {
        var expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/web";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) === 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function removeCookie(name) {
    if (getCookie(name)) {
        createCookie(name, "", -1);
    }
}
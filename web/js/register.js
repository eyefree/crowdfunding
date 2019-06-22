function checkName() {
    var name = document.getElementById("username").value;
    var span = document.getElementById("name_msg");
    console.log(name);
    var exp = /^\w{5,15}$/;
    if (name.trim().length !== 0) {
        if (exp.test(name)) {
            span.style.color = "green";
            span.innerHTML = "格式正确";
            return true;
        } else {
            span.style.color = "red";
            span.innerHTML = "格式错误";
            return false;
        }
    } else {
        span.innerHTML = "会员名不能为空";
    }
}

function checkPwd1() {
    var pwd1 = document.getElementById("password").value;
    var span = document.getElementById("pwd1_msg");
    var exp = /^(?![a-zA-z]+$)(?!\d+$)(?![!@#$%^&*]+$)[a-zA-Z\d!@#$%^&*]+$/;
    if (pwd1.trim().length !== 0) {
        if (exp.test(pwd1)) {
            span.style.color = "green";
            span.innerHTML = "格式正确";
            return true;
        } else {
            span.style.color = "red";
            span.innerHTML = "格式错误";
            return false;
        }
    } else {
        span.innerHTML = "密码不能为空";
    }
}

function checkPwd2() {
    var pwd1 = document.getElementById("password").value;
    var pwd2 = document.getElementById("pass2").value;
    var span = document.getElementById("pwd2_msg");
    if (pwd2.trim().length !== 0) {
        if (pwd1 === pwd2) {
            span.style.color = "green";
            span.innerHTML = "两次密码一致";
            return true;
        } else {
            span.style.color = "red";
            span.innerHTML = "两次密码不一致";
            return false;
        }
    }
}

function checkEmail() {
    var email = document.getElementById("email").value;
    var span = document.getElementById("email_msg");
    var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
    if (email.trim().length !== 0) {
        if (reg.test(email)) {
            span.style.color = "green";
            span.innerHTML = "格式正确";
            return true;
        } else {
            span.style.color = "red";
            span.innerHTML = "格式错误";
            return false;
        }
    }
    else {
        span.innerHTML = "邮箱不能为空";
    }
}

function checkTel() {
    var tel = document.getElementById("tel").value;
    var span = document.getElementById("tel_msg");
    var reg = /^1[0-9]{10}$/;
    if (tel.trim().length !== 0) {
        if (reg.test(tel)) {
            span.style.color = "green";
            span.innerHTML = "格式正确";
            return true;
        } else {
            span.style.color = "red";
            span.innerHTML = "格式错误";
            return false;
        }
    } else {
        span.innerHTML = "电话不能为空";
    }
}

function checkForm() {
    return checkName() && checkPwd1() && checkPwd2() && checkEmail() && checkTel();
}

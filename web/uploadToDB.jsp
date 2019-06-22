<%--
  Created by IntelliJ IDEA.
  User: eyefree
  Date: 2019/6/9
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心|游戏众筹</title>
    <link rel="icon" sizes="180*180" href="img/ant.png">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/uploadToDB.css">
</head>
<script type="text/javascript">
    function check () {
        var f1 = document.getElementById("file1").value;
        var f2 = document.getElementById("file2").value;
        var d1 = document.getElementById("description1").value;
        if(f1.trim().length == 0 || f2.trim().length == 0 || d1.trim().length == 0){
            alert("请填入全部信息(⊙﹏⊙)");
            return false;
        }
    }
</script>
<body>
<div style="padding:5px; color:red;font-style:italic;">
    ${errorMessage}
</div>
<div class="relative">
    <section
            class="bg-white flex flex-wrap flex-nowrap-md border-bottom border-grey-400 justify-between w100p">
        <section class="order-2 order-1-md flex grow-1-md pl3 pl4-md py2 basis50p-md">
            <a href="index.html"
               class="pr3 mr2 flex-sm items-center keyboard-focusable soft-black hover-ksr-green-700">首页</a>
        </section>
        <section
                class="justify-end order-3 flex grow-1-md pr3 pr4-sm items-center py2 basis50p-md">
            <p class="default" id="default">
                <a href="login.html" class="soft-black hover-ksr-green-700 ml3">登入</a>
                <a href="register.html" class="soft-black hover-ksr-green-700 ml3">注册</a>
            </p>
            <p class="logged" id="logged">
                <a href="#" class="soft-black hover-ksr-green-700 ml3" id="login-name"></a>
                <a href="javascript:" class="soft-black hover-ksr-green-700 ml3" id="outlogin">退出</a>
            </p>
        </section>
    </section>
</div>
<div class="cc-nav-wrp">
    <ul class="nav-wrp">
        <li>
            <a href="" class="nav-item"><span>首页管理</span></a>
        </li>
        <li>
            <a href="" class="nav-item"><span>内容管理</span></a>
        </li>
        <li>
            <a href="" class="nav-item"><span>个人设置</span></a>
        </li>
        <li>
            <a href="" class="nav-item"><span>申诉中心</span></a>
        </li>
    </ul>
</div>
<div class="info-wrp">
    <div class="text">请上传您的项目("▔□▔)</div>
    <img src="" alt="">
    <form method="post" action="/web/uploadToDB" enctype="multipart/form-data" onsubmit="return check()">
        <br><br><br><br>
        <span class="type-12 type-13-md dark-grey-500 text-uppercase mb3 maison-book bold" style="font-size: 20px">
            项目宣传视频:</span>
        <a href="javascript:" class="a-upload">
            <input type="file" name="file" id="file1" accept="video/*">点击这里上传文件
        </a>
        <br><br>
        <span class="type-12 type-13-md dark-grey-500 text-uppercase mb3 maison-book bold"  style="font-size: 20px">
            项目说明文档:</span>
        <a href="javascript:" class="a-upload">
            <input type="file" name="file" id="file2" accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document">点击这里上传文件
        </a>

        <br><br><br><br>
        <span class="type-12 type-13-md dark-grey-500 text-uppercase mb3 maison-book bold">
            项目简介:</span>
        <input type="text" name="description" size="50" id="description1" style="outline-color: #ebcece;
    height: 2.5em;
    border-radius: 4px;
    border: 1px solid #c8cccf;
    color: #868eca;
    text-decoration: none;
    border-bottom: 1px solid #ebcece;">
        <br>
        <br><br><br><br>
        <input type="submit" value="立即上传" class="cc-btn is-main">
    </form>
</div>
<div class="border-bottom border-medium py8" style="padding-top: 0rem !important"></div>
<div class="pt4">
    <div class="grid-container">
        <div class="grid-row">
            <div class="grid-col-12">
                <section>
                    <ul class="flex flex-wrap type-13">
                        <li class="mr4 mb2 mb0-sm"><a href="#"
                                                      class="link-soft-black keyboard-focusable">信任与安全</a>
                        </li>
                        <li class="mr4 mb2 mb0-sm"><a href="#"
                                                      class="link-soft-black keyboard-focusable">使用条款</a></li>
                        <li class="mr4 mb2 mb0-sm"><a href="#"
                                                      class="link-soft-black keyboard-focusable">隐私权原则</a>
                        </li>
                        <li class="mr4 mb2 mb0-sm"><a href="#"
                                                      class="link-soft-black keyboard-focusable">Cookie原则</a>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="js/index_cookie.js"></script>
<script type="text/javascript">
    if (getCookie("username")) {
        oDefault.style.display = "none";
        oLogged.style.display = "block";
        oLoginName.innerHTML = getCookie("username");
    } else {
        alert("请先登录（〃｀ 3′〃）")
        window.location = "login.html"
    }
</script>

</html>

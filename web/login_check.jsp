<%--
  Created by IntelliJ IDEA.
  User: eyefree
  Date: 2019/5/30
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>

<html>
<head>
    <title>登录|验证</title>
</head>
<body>
<%
    String url = "jdbc:mysql://localhost:3306/crowdfunding?serverTimezone=UTC&useSSL = false";
    String users = "root";
    String passwords = "123456";
    String sql = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    String username1 = null;
    String tel1 = null;
    String password1 = null;
    String tel = request.getParameter("tel");
    String password = request.getParameter("password");
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    }
    try {//检验数据
        conn = DriverManager.getConnection(url, users, passwords);
        sql = "SELECT username,tel,password FROM user_message WHERE tel='" + tel + "' AND password='" + password + "';";
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            username1 = rs.getString(1);
            tel1 = rs.getString(2);
            password1 = rs.getString(3);
            if (tel1.equals(tel) && password1.equals(password)) {
                Cookie username = new Cookie("username",username1 );
                username.setMaxAge(60*60*24);
                response.addCookie(username);
                response.sendRedirect("index.html");
            } else {
                response.sendRedirect("login.html");
            }
        }
%>
<script type="text/javascript">
    alert("您输入的信息有误，请重新输入(⊙﹏⊙)");
    window.location = 'login.html';
</script>
<%
        pstmt.close();
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect("login.html");
    }
%>
</body>
</html>
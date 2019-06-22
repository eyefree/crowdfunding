<%--
  Created by IntelliJ IDEA.
  User: eyefree
  Date: 2019/5/30
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<html>
<head>
    <title>注册|验证</title>
</head>
<body>
<jsp:useBean id="user" scope="session" class="zzu.User"/>
<jsp:setProperty property="*" name="user"/>

<%
    String url = "jdbc:mysql://localhost:3306/crowdfunding?serverTimezone=UTC&useSSL = false";
    String users = "root";
    String passwords = "123456";
    String sql = null;
    Connection conn = null;
    PreparedStatement pstmt = null;
    //从JavaBean中获取数据
    String username = user.getUsername();
    String tel = user.getTel();
    String password = user.getPassword();
    String email = user.getEmail();
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        out.println(e.getMessage());
    }
    try {//将数据存入数据库中
        conn = DriverManager.getConnection(url, users, passwords);
        sql = "insert into user_message(username, tel, password, email) values (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, tel);
        pstmt.setString(3, password);
        pstmt.setString(4, email);
        pstmt.executeUpdate();
        pstmt.close();
%>
<h3>注册成功!!!</h3>
<h3>三秒钟后自动转到登录页面!!!</h3>
<h3>如果没有跳转，请点击<a href="login.html">这里</a>!!!</h3>
<%
    response.setHeader("Refresh", "3;url=login.html");
} catch (SQLException e) {
%>
<h3>注册失败!!!</h3>
<h3>三秒钟后自动转到注册页面!!!</h3>
<h3>如果没有跳转，请点击<a href="register.html">这里</a>!!!</h3>
<%
        response.setHeader("Refresh", "3;url=register.html");
    } finally {//关闭数据库连接
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            out.println(e.getMessage());
        }
    }
%>
</body>
</html>



<%@ page import="java.sql.*" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: eyefree
  Date: 2019/6/9
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载</title>
</head>
<body>
<form>
    请输入项目文件名：
    <br>
    <input type="text" name="filename">
    <input type="submit" value="下载">
</form>
<%
    String filename = request.getParameter("filename");
    try {

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdfunding?serverTimezone=UTC&useSSL = false", "root", "123456");

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select FILE_DATA from ATTACHMENT where FILE_NAME = '" + filename + "';");
        while (rs.next()) {
            Blob blob = rs.getBlob(1);
            InputStream in = blob.getBinaryStream();
            String path = "D:\\" + filename;
            FileOutputStream file = new FileOutputStream(path);
            int b = -1;
            while ((b = in.read()) != -1) {
                file.write(b);
            }
        }
    } catch (Exception e) {
        System.out.println(e.getMessage());
    }
%>
</body>
</html>

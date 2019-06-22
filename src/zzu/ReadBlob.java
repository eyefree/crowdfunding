package zzu;

import java.sql.*;
import java.io.*;


public class ReadBlob {

    public static void main(String[] args) {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/crowdfunding?serverTimezone=UTC&useSSL = false", "root", "123456");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select FILE_DATA from ATTACHMENT where FILE_NAME = '67615740_p1_master1200.jpg'");
            while (rs.next()) {
                Blob blob = rs.getBlob(1);
                InputStream in = blob.getBinaryStream();
                FileOutputStream file = new FileOutputStream("D:\\67615740_p1_master1200.jpg");
                int b = -1;
                while ((b = in.read()) != -1) {
                    file.write(b);
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

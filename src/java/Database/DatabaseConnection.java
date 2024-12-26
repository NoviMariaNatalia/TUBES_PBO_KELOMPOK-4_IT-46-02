/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;

/**
 *
 * @author Novi Maria Natalia
 */

import java.sql.*;

public class DatabaseConnection {
    Connection con;
    Statement stmt;
    PreparedStatement psmt;
    public boolean isConnected;
    public String message;
    
    public DatabaseConnection() {  
        try {  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nspace_pbo", "root", "");  
            stmt = con.createStatement();  
            isConnected = true;  
            message = "DB connected";  
        } catch(Exception e) {  
            isConnected = false;  
            message = e.getMessage();  
        }  
    }
    
    public void disconnect() {  
        try {  
            if (psmt != null) psmt.close();
            if (stmt != null) stmt.close();
            if (con != null) con.close();
            message = "DB disconnected";  
        } catch(Exception e) {  
            message = e.getMessage();  
        }
    }
    
    public void runQuery(String query) {  
        try {  
            int result = stmt.executeUpdate(query);  
            message = "info: " + result + " rows affected";  
        } catch (Exception e) {  
            message = e.getMessage();  
        }  
    } 
    
    public ResultSet getData(String query) {  
        ResultSet rs = null;  
        try {  
            rs = stmt.executeQuery(query);  
        } catch (Exception e) {  
            message = e.getMessage();  
        }  
        return rs;  
    }
    
    public PreparedStatement prepareStatement(String query) {
        try {
            psmt = con.prepareStatement(query);
        } catch (Exception e) {
            message = e.getMessage();
            return null;
        }
        return psmt;
    }
}
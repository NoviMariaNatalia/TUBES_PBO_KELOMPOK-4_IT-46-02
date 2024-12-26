<%-- 
    Document   : addRoom
    Created on : 26 Dec 2024, 11.36.23
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Room</title>
    <style>
        .form-container { margin: 20px; }
        .form-field { margin: 10px 0; }
    </style>
</head>
<body>
    <h1>Add New Room</h1>
    
    <div class="form-container">
        <form action="../RoomServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-field">
                <label for="buildingId">Building:</label><br>
                <select id="buildingId" name="buildingId" required>
                    <%
                        DatabaseConnection db = new DatabaseConnection();
                        ResultSet rs = db.getData("SELECT * FROM buildings");
                        while(rs.next()) {
                            out.println("<option value='" + rs.getInt("id") + "'>" + 
                                      rs.getString("name") + "</option>");
                        }
                        db.disconnect();
                    %>
                </select>
            </div>
            
            <div class="form-field">
                <label for="name">Room Name:</label><br>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-field">
                <label for="floor">Floor:</label><br>
                <input type="number" id="floor" name="floor" required>
            </div>
            
            <div class="form-field">
                <label for="capacity">Capacity:</label><br>
                <input type="number" id="capacity" name="capacity" required>
            </div>
            
            <div class="form-field">
                <label for="facilities">Facilities:</label><br>
                <textarea id="facilities" name="facilities" required></textarea>
            </div>
            
            <div class="form-field">
                <label for="photo">Photo:</label><br>
                <input type="text" id="photo" name="photo" required>
            </div>
            
            <div class="form-field">
                <input type="submit" value="Add Room">
                <a href="adminDashboard.jsp">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

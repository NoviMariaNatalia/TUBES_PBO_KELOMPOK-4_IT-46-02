<%-- 
    Document   : addBuilding
    Created on : 26 Dec 2024, 10.06.00
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Building</title>
    <style>
        .form-container { margin: 20px; }
        .form-field { margin: 10px 0; }
    </style>
</head>
<body>
    <h1>Add New Building</h1>
    
    <div class="form-container">
        <form action="../BuildingServlet" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-field">
                <label for="name">Building Name:</label><br>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-field">
                <label for="address">Address:</label><br>
                <textarea id="address" name="address" required></textarea>
            </div>
            
            <div class="form-field">
                <label for="photo">Photo:</label><br>
                <input type="text" id="photo" name="photo" required>
            </div>
            
            <div class="form-field">
                <input type="submit" value="Add Building">
                <a href="adminDashboard.jsp">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>

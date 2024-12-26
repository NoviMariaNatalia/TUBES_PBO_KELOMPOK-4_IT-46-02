<%-- 
    Document   : adminDashboard
    Created on : 23 Dec 2024, 12.15.24
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        .menu-container { margin: 20px; }
        .menu-item { margin: 10px 0; }
    </style>
</head>
<body>
    <h1>Admin Dashboard</h1>
    
    <div class="menu-container">
        <div class="menu-item">
            <h3>Building Management</h3>
            <a href="addBuilding.jsp">Add New Building</a><br>
            <a href="viewBuildings.jsp">View/Edit Buildings</a>
        </div>
        
        <div class="menu-item">
            <h3>Room Management</h3>
            <a href="addRoom.jsp">Add New Room</a><br>
            <a href="viewBuildings.jsp">View/Edit Rooms</a>
        </div>
        
        <div class="menu-item">
            <h3>Booking Management</h3>
            <a href="viewBookingRequests.jsp">View Booking Requests</a><br>
            <a href="viewBookingHistory.jsp">View Booking History</a>
        </div>
        
        <div class="menu-item">
            <a href="../LogoutServlet">Logout</a>
        </div>
    </div>
</body>
</html>

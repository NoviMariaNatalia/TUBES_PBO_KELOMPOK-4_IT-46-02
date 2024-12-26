<%-- 
    Document   : studentDashboard
    Created on : Dec 26, 2024, 3:54:00 PM
    Author     : ahmad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .menu-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }
        .menu-item {
            background-color: #f5f5f5;
            border-radius: 5px;
            padding: 15px;
            margin: 10px 0;
        }
        .menu-item h3 {
            margin-top: 0;
            color: #333;
        }
        .menu-item a {
            display: inline-block;
            text-decoration: none;
            color: #2196F3;
            margin: 5px 0;
        }
        .menu-item a:hover {
            text-decoration: underline;
        }
        .logout-btn {
            color: #f44336 !important;
        }
    </style>
</head>
<body>
    <h1>Dashboard</h1>
    
    <div class="menu-container">
        <div class="menu-item">
            <h3>Room Booking</h3>
            <a href="viewBuildingsList.jsp">View Buildings</a><br>
            <a href="searchRoom.jsp">Search Room</a>
        </div>
        
        <div class="menu-item">
            <h3>My Bookings</h3>
            <a href="bookingHistory.jsp">View Booking History</a>
        </div>
        
        <div class="menu-item">
            <a href="../LogoutServlet" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar bg-primary">
        <div class="container">
            <span class="navbar-brand mb-0 h1 text-white">Student Dashboard</span>
        </div>
    </nav>
    
    <div class="container my-4">
        <div class="card mb-3">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">Room Booking</h5>
            </div>
            <div class="card-body">
                <a href="viewBuildingList.jsp" class="d-block text-decoration-none mb-2">View Buildings</a>
                <a href="searchRoom.jsp" class="d-block text-decoration-none">Search Room</a>
            </div>
        </div>
        
        <div class="card mb-3">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">My Bookings</h5>
            </div>
            <div class="card-body">
                <a href="bookingHistory.jsp" class="d-block text-decoration-none">View Booking History</a>
            </div>
        </div>
        
        <div class="card">
            <div class="card-body">
                <a href="../LogoutServlet" class="text-danger text-decoration-none">Logout</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

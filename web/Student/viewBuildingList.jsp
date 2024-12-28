<%-- 
    Document   : viewBulidingList
    Created on : Dec 26, 2024, 3:54:39 PM
    Author     : ahmad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buildings List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar bg-primary">
        <div class="container">
            <span class="navbar-brand mb-0 h1 text-white">Buildings List</span>
        </div>
    </nav>
    
    <div class="container my-4">
        <a href="studentDashboard.jsp" class="btn btn-secondary mb-4">Back to Dashboard</a>
        
        <%
            DatabaseConnection db = new DatabaseConnection();
            try {
                String query = "SELECT * FROM buildings";
                ResultSet rs = db.getData(query);
                
                while(rs.next()) {
        %>
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="<%= rs.getString("photo") %>" 
                                     alt="<%= rs.getString("name") %>" 
                                     class="img-fluid rounded">
                            </div>
                            <div class="col-md-9">
                                <h5 class="card-title text-primary"><%= rs.getString("name") %></h5>
                                <p class="card-text">
                                    <strong>Address:</strong> <%= rs.getString("address") %>
                                </p>
                                <a href="viewRoomList.jsp?buildingId=<%= rs.getInt("id") %>" 
                                   class="btn btn-primary">View Rooms</a>
                            </div>
                        </div>
                    </div>
                </div>
        <%
                }
            } catch(Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            } finally {
                db.disconnect();
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

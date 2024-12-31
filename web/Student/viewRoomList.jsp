<%-- 
    Document   : viewRoomList
    Created on : Dec 26, 2024, 3:54:54 PM
    Author     : ahmad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar bg-primary">
        <div class="container">
            <span class="navbar-brand mb-0 h1 text-white">Room List</span>
        </div>
    </nav>
    
    <div class="container my-4">
        <a href="viewBuildingsList.jsp" class="btn btn-secondary mb-4">Back to Buildings</a>
        
        <%
            int buildingId = Integer.parseInt(request.getParameter("buildingId"));
            DatabaseConnection db = new DatabaseConnection();
            try {
                // Get building name
                String buildingQuery = "SELECT name FROM buildings WHERE id = ?";
                PreparedStatement buildingPst = db.prepareStatement(buildingQuery);
                buildingPst.setInt(1, buildingId);
                ResultSet buildingRs = buildingPst.executeQuery();
                
                if(buildingRs.next()) {
        %>
                    <h4 class="text-secondary mb-4">Rooms in <%= buildingRs.getString("name") %></h4>
        <%
                }
                
                // Get rooms
                String roomsQuery = "SELECT * FROM rooms WHERE building_id = ?";
                PreparedStatement roomsPst = db.prepareStatement(roomsQuery);
                roomsPst.setInt(1, buildingId);
                ResultSet rs = roomsPst.executeQuery();
                
                boolean hasRooms = false;
                while(rs.next()) {
                    hasRooms = true;
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
                                    <div class="mb-2">
                                        <span class="badge bg-secondary me-2">Floor <%= rs.getInt("floor") %></span>
                                        <span class="badge bg-secondary">Capacity: <%= rs.getInt("capacity") %> people</span>
                                    </div>
                                    <p class="card-text">
                                        <strong>Facilities:</strong><br>
                                        <%= rs.getString("facilities") %>
                                    </p>
                                    <a href="bookingForm.jsp?roomId=<%= rs.getInt("id") %>" 
                                       class="btn btn-primary">Book This Room</a>
                                </div>
                            </div>
                        </div>
                    </div>
        <%
                }
                
                if (!hasRooms) {
        %>
                    <div class="alert alert-info">No rooms available in this building.</div>
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

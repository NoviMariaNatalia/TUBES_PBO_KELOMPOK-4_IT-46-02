<%-- 
    Document   : viewBuildings
    Created on : 26 Dec 2024, 18.07.05
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Buildings</title>
    <style>
        .building-container { margin: 20px; }
        .building-item { border: 1px solid #ccc; margin: 10px 0; padding: 10px; }
        .room-item { margin-left: 20px; border-left: 2px solid #eee; padding-left: 10px; }
    </style>
</head>
<body>
    <h1>Building List</h1>
    
    <% if(request.getParameter("message") != null) { %>
        <p><%= request.getParameter("message") %></p>
    <% } %>
    
    <div class="building-container">
        <%
            DatabaseConnection db = new DatabaseConnection();
            ResultSet buildings = db.getData("SELECT * FROM buildings");
            
            while(buildings.next()) {
                int buildingId = buildings.getInt("id");
        %>
            <div class="building-item">
                <h3><%= buildings.getString("name") %></h3>
                <p>Address: <%= buildings.getString("address") %></p>
                <p>Photo: <%= buildings.getString("photo") %></p>
                
                <div class="building-actions">
                    <a href="editBuilding.jsp?id=<%= buildingId %>">Edit Building</a>
                    <form action="../BuildingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= buildingId %>">
                        <input type="submit" value="Delete Building" 
                               onclick="return confirm('Apakah Anda yakin hendak menghapus Gedung <%= buildings.getString("name") %> ?')">
                    </form>
                </div>
                
                <h4>Rooms:</h4>
                <%
                    PreparedStatement pst = db.prepareStatement(
                        "SELECT * FROM rooms WHERE building_id = ?");
                    pst.setInt(1, buildingId);
                    ResultSet rooms = pst.executeQuery();
                    
                    while(rooms.next()) {
                %>
                    <div class="room-item">
                        <p>Name: <%= rooms.getString("name") %></p>
                        <p>Floor: <%= rooms.getInt("floor") %></p>
                        <p>Capacity: <%= rooms.getInt("capacity") %></p>
                        <p>Facilities: <%= rooms.getString("facilities") %></p>
                        <p>Photo: <%= rooms.getString("photo") %></p>
                        
                        <a href="editRoom.jsp?id=<%= rooms.getInt("id") %>">Edit Room</a>
                        <form action="../RoomServlet" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= rooms.getInt("id") %>">
                            <input type="submit" value="Delete Room" 
                                   onclick="return confirm('Apakah Anda yakin hendak menghapus Ruang <%= rooms.getString("name") %> ?')">
                        </form>
                    </div>
                <% } %>
            </div>
        <%
            }
            db.disconnect();
        %>
    </div>
    
    <a href="adminDashboard.jsp">Back to Dashboard</a>
</body>
</html>

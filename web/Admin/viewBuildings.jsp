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
    <title>Lihat Gedung</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .building-container { 
            margin: 20px; 
        }
        .building-item { 
            border: 1px solid #dee2e6; 
            margin: 15px 0; 
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .room-item { 
            margin: 15px 0 15px 20px; 
            border-left: 3px solid #dee2e6; 
            padding: 15px;
            background-color: #f8f9fa;
            border-radius: 0 8px 8px 0;
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="adminDashboard.jsp">Dashboard Admin</a>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Daftar Gedung</h2>
            <a href="adminDashboard.jsp" class="btn btn-secondary">Kembali ke Dashboard</a>
        </div>

        <% if(request.getParameter("message") != null) { %>
            <div class="alert alert-info alert-dismissible fade show" role="alert">
                <%= request.getParameter("message") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <div class="building-container">
            <%
                DatabaseConnection db = new DatabaseConnection();
                ResultSet buildings = db.getData("SELECT * FROM buildings");
                
                while(buildings.next()) {
                    int buildingId = buildings.getInt("id");
            %>
                <div class="building-item">
                    <div class="row">
                        <div class="col-md-8">
                            <h3 class="text-primary"><%= buildings.getString("name") %></h3>
                            <p class="mb-2"><strong>Alamat:</strong> <%= buildings.getString("address") %></p>
                            <p class="mb-3"><strong>Foto:</strong> <%= buildings.getString("photo") %></p>
                        </div>
                        <div class="col-md-4 text-md-end">
                            <a href="editBuilding.jsp?id=<%= buildingId %>" class="btn btn-warning mb-2">Edit Gedung</a>
                            <form action="../BuildingServlet" method="post" class="d-inline">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<%= buildingId %>">
                                <button type="submit" class="btn btn-danger mb-2" 
                                        onclick="return confirm('Apakah Anda yakin hendak menghapus Gedung <%= buildings.getString("name") %> ?')">
                                    Hapus Gedung
                                </button>
                            </form>
                        </div>
                    </div>

                    <h4 class="mt-4 mb-3 text-secondary">Ruang:</h4>
                    <%
                        PreparedStatement pst = db.prepareStatement(
                            "SELECT * FROM rooms WHERE building_id = ?");
                        pst.setInt(1, buildingId);
                        ResultSet rooms = pst.executeQuery();
                        
                        while(rooms.next()) {
                    %>
                        <div class="room-item">
                            <div class="row">
                                <div class="col-md-8">
                                    <h5 class="text-primary mb-3"><%= rooms.getString("name") %></h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <p class="mb-2"><strong>Lantai:</strong> <%= rooms.getInt("floor") %></p>
                                            <p class="mb-2"><strong>Kapasitas:</strong> <%= rooms.getInt("capacity") %> people</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="mb-2"><strong>Fasilitas:</strong> <%= rooms.getString("facilities") %></p>
                                            <p class="mb-2"><strong>Foto:</strong> <%= rooms.getString("photo") %></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 text-md-end">
                                    <a href="editRoom.jsp?id=<%= rooms.getInt("id") %>" class="btn btn-outline-warning mb-2">Edit Ruang</a>
                                    <form action="../RoomServlet" method="post" class="d-inline">
                                        <input type="hidden" name="action" value="delete">
                                        <input type="hidden" name="id" value="<%= rooms.getInt("id") %>">
                                        <button type="submit" class="btn btn-outline-danger mb-2"
                                                onclick="return confirm('Apakah Anda yakin hendak menghapus Ruang <%= rooms.getString("name") %> ?')">
                                            Hapus Ruang
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            <%
                }
                db.disconnect();
            %>
        </div>
    </div>

    <!-- Bootstrap Bundle-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

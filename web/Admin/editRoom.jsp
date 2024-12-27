<%-- 
    Document   : editRoom
    Created on : Dec 28, 2024, 12:11:18 AM
    Author     : Nadhif Ahmad Mutawakkil Zaidan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Ruang</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .form-container {
                margin: 20px;
                max-width: 800px;
            }
            .form-field {
                margin: 10px 0;
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
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Edit Ruang</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-container mx-auto">
                                <%
                                    // Get room ID from the request
                                    String roomId = request.getParameter("roomId");
                                    DatabaseConnection db = new DatabaseConnection();
                                    String query = "SELECT r.*, b.name as building_name FROM rooms r "
                                            + "JOIN buildings b ON r.building_id = b.id "
                                            + "WHERE r.id = ?";
                                    PreparedStatement psmt = db.prepareStatement(query);
                                    psmt.setInt(1, Integer.parseInt(roomId));
                                    ResultSet rs = psmt.executeQuery();
                                    if (rs.next()) {
                                %>
                                <form action="../RoomServlet" method="post">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="roomId" value="<%= rs.getInt("id")%>">

                                    <div class="form-field mb-3">
                                        <label for="buildingId" class="form-label">Gedung:</label>
                                        <select class="form-select" id="buildingId" name="buildingId" required>
                                            <%
                                                // Fetch all buildings for the dropdown
                                                ResultSet buildings = db.getData("SELECT * FROM buildings");
                                                while (buildings.next()) {
                                                    String selected = (buildings.getInt("id") == rs.getInt("building_id")) ? "selected" : "";
                                                    out.println("<option value='" + buildings.getInt("id") + "' " + selected + ">" + buildings.getString("name") + "</option>");
                                                }
                                                buildings.close();
                                            %>
                                        </select>
                                    </div>

                                    <div class="form-field mb-3">
                                        <label for="name" class="form-label">Nama Ruang:</label>
                                        <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name")%>" required>
                                    </div>

                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-field">
                                                <label for="floor" class="form-label">Lantai:</label>
                                                <input type="number" class="form-control" id="floor" name="floor" value="<%= rs.getInt("floor")%>" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-field">
                                                <label for="capacity" class="form-label">Kapasitas:</label>
                                                <input type="number" class="form-control" id="capacity" name="capacity" value="<%= rs.getInt("capacity")%>" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-field mb-3">
                                        <label for="facilities" class="form-label">Fasilitas:</label>
                                        <textarea class="form-control" id="facilities" name="facilities" rows="3" required><%= rs.getString("facilities")%></textarea>
                                    </div>

                                    <div class="form-field mb-3">
                                        <label for="photo" class="form-label">Foto:</label>
                                        <input type="text" class="form-control" id="photo" name="photo" value="<%= rs.getString("photo")%>" required>
                                    </div>

                                    <div class="form-field d-flex gap-2">
                                        <button type="submit" class="btn btn-primary">Simpan</button>
                                        <a href="adminDashboard.jsp" class="btn btn-secondary">Kembali</a>
                                    </div>
                                </form>
                                <%
                                    }
                                    db.disconnect();
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>


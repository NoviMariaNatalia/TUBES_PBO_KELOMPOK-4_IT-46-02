<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Gedung</title>
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
                        <h2 class="mb-0">Edit Gedung</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-container mx-auto">
                            <% 
                                String idParam = request.getParameter("id");
                                if (idParam == null || idParam.isEmpty()) {
                                    out.println("<div class='alert alert-danger'>ID gedung tidak ditemukan. <a href='adminDashboard.jsp'>Kembali</a></div>");
                                } else {
                                    try {
                                        int buildingId = Integer.parseInt(idParam);
                                        DatabaseConnection db = new DatabaseConnection();
                                        PreparedStatement pst = db.prepareStatement("SELECT * FROM buildings WHERE id = ?");
                                        pst.setInt(1, buildingId);
                                        ResultSet rs = pst.executeQuery();
                                        if (rs.next()) {
                            %>
                            <form action="../BuildingServlet" method="post">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                
                                <div class="form-field mb-3">
                                    <label for="name" class="form-label">Nama Gedung:</label>
                                    <input type="text" class="form-control" id="name" name="name" value="<%= rs.getString("name") %>" required>
                                </div>
                                
                                <div class="form-field mb-3">
                                    <label for="address" class="form-label">Alamat:</label>
                                    <textarea class="form-control" id="address" name="address" rows="3" required><%= rs.getString("address") %></textarea>
                                </div>
                                
                                <div class="form-field mb-3">
                                    <label for="photo" class="form-label">Foto:</label>
                                    <input type="text" class="form-control" id="photo" name="photo" value="<%= rs.getString("photo") %>" required>
                                </div>
                                
                                <div class="form-field d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    <a href="adminDashboard.jsp" class="btn btn-secondary">Kembali</a>
                                </div>
                            </form>
                            <% 
                                        } else {
                                            out.println("<div class='alert alert-danger'>Data gedung tidak ditemukan. <a href='adminDashboard.jsp'>Kembali</a></div>");
                                        }
                                        db.disconnect();
                                    } catch (NumberFormatException e) {
                                        out.println("<div class='alert alert-danger'>ID tidak valid. <a href='adminDashboard.jsp'>Kembali</a></div>");
                                    }
                                }
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

<%-- 
    Document   : addBuilding
    Created on : 26 Dec 2024, 10.06.00
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Gedung Baru</title>
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
                        <h2 class="mb-0">Tambah Gedung Baru</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-container mx-auto">
                            <form action="../BuildingServlet" method="post">
                                <input type="hidden" name="action" value="add">
                                
                                <div class="form-field mb-3">
                                    <label for="name" class="form-label">Nama Gedung:</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                
                                <div class="form-field mb-3">
                                    <label for="address" class="form-label">Alamat:</label>
                                    <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
                                </div>
                                
                                <div class="form-field mb-3">
                                    <label for="photo" class="form-label">Foto:</label>
                                    <input type="text" class="form-control" id="photo" name="photo" required>
                                </div>
                                
                                <div class="form-field d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">Simpan</button>
                                    <a href="adminDashboard.jsp" class="btn btn-secondary">Kembali</a>
                                </div>
                            </form>
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

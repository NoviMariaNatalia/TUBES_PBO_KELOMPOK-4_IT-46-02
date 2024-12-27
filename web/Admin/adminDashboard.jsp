<%-- 
    Document   : adminDashboard
    Created on : 23 Dec 2024, 12.15.24
    Author     : Novi Maria Natalia
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .menu-container { 
            margin: 20px; 
        }
        .menu-item { 
            margin: 20px 0;
            padding: 20px;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .menu-link {
            text-decoration: none;
            color: #495057;
            display: block;
            padding: 8px 0;
            transition: all 0.3s ease;
        }
        .menu-link:hover {
            color: #0d6efd;
            padding-left: 10px;
        }
        .btn-menu {
            width: 100%;
            text-align: left;
            margin-bottom: 8px;
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">Dashboard Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="../LogoutServlet">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row">
            <!-- Building Management Card -->
            <div class="col-md-4">
                <div class="card menu-item">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Manajemen Gedung</h3>
                        <div class="d-grid gap-2">
                            <a href="addBuilding.jsp" class="btn btn-outline-primary btn-menu">Tambah Gedung Baru</a>
                            <a href="viewBuildings.jsp" class="btn btn-outline-primary btn-menu">Lihat/Edit Gedung</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Room Management Card -->
            <div class="col-md-4">
                <div class="card menu-item">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Manajemen Ruang</h3>
                        <div class="d-grid gap-2">
                            <a href="addRoom.jsp" class="btn btn-outline-success btn-menu">Tambah Ruang Baru</a>
                            <a href="viewBuildings.jsp" class="btn btn-outline-success btn-menu">Lihat/Edit Ruang</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Booking Management Card -->
            <div class="col-md-4">
                <div class="card menu-item">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Manajemen Peminjaman</h3>
                        <div class="d-grid gap-2">
                            <a href="viewBookingRequests.jsp" class="btn btn-outline-warning btn-menu">Lihat Permintaan Peminjaman</a>
                            <a href="viewBookingHistory.jsp" class="btn btn-outline-warning btn-menu">Lihat Riwayat Peminjaman</a>
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

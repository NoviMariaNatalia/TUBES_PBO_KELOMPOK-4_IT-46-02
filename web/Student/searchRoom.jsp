<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pencarian Ruangan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            <a class="navbar-brand" href="studentDashboard.jsp">Dashboard Mahasiswa</a>
        </div>
    </nav>
    
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h2 class="mb-0">Pencarian Ruangan</h2>
                    </div>
                    <div class="card-body">
                        <div class="form-container mx-auto">
                            <form action="/TUBES_PBO_FINAL/Student/SearchServlet" method="get">
                                
                                
                                <div class="form-field mb-3">
                                    <label for="name_building" class="form-label">Nama Gedung:</label>
                                    <input type="text" class="form-control" id="building_id" name="building_id" required>
                                </div>
                                
                                <div class="form-field mb-3">
                                    <label for="name_room" class="form-label">Nama Ruang:</label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
  
                                <div class="form-field d-flex gap-2">
                                    <button type="submit" class="btn btn-primary">Cari</button>
                                    <a href="studentDashboard.jsp" class="btn btn-secondary">Kembali</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h2 class="mb-0">Hasil Pencarian</h2>
                    </div>
                    <div id="results">
                        <% 
                            String results = (String) request.getAttribute("results");
                            if (results != null) {
                                out.print(results);
                            } else {
                                out.print("<p>No results to display.</p>");
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


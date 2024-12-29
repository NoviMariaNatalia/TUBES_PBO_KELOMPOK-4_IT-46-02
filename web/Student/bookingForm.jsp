<%-- 
    Document   : bookingForm
    Created on : 26 Dec 2024, 15.59.50
    Author     : USER
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<%
    if (session.getAttribute("username") == null) {
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Booking Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-expand-lg bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">N-Space</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <a href="#" class="btn btn-warning">Logout</a>
        </div>
  </div>
</nav>
    
<div class="container mt-3">
    <h3>Form Peminjaman Ruangan</h3>
    <div class="row">
        <div class="card shadow p-3 mb-5">
            <div class="card-body">
                <h5 class="card-title">Isi Form dibawah Ini Untuk Mengajukan Peminjaman</h5>
                <% if (request.getParameter("message") != null) { %>
                    <div class="alert alert-info"><%= request.getParameter("message") %></div>
                <% } %>

                <form action="../BookingServlet" method="post">
                    <div class="row mb-3 mt-5">
                        <label for="roomId" class="col-sm-2 col-form-label">Ruangan</label>
                        <div class="col-sm-10">
                            <select class="form-select" id="roomId" name="roomId" required>
                                <option value="">Pilih Ruangan</option>
                                    <%
                                        DatabaseConnection db= new DatabaseConnection();
                                        ResultSet rs = db.getData("SELECT r.id, r.name, bg.name as building_name FROM rooms r JOIN buildings bg ON r.building_id = bg.id");
                                        while (rs.next()) {
                                    %>
                                <option value="<%= rs.getInt("id") %>">
                                    <%= rs.getString("building_name") %> - <%= rs.getString("name") %>
                                    
                                </option>
                                    <%
                                    }
                                        db.disconnect();
                                    %>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="start_date" class="col-sm-2 col-form-label">Tanggal Mulai</label>
                        <div class="col-sm-2">
                            <input type="date" class="form-control" id="start_date" name="start_date" required>
                        </div>
                        <label for="end_date" class="col-sm-2 col-form-label">Tanggal Selesai</label>
                        <div class="col-sm-2">
                            <input type="date" class="form-control" id="end_date" name="end_date" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="start_time" class="col-sm-2 col-form-label">Waktu Mulai</label>
                        <div class="col-sm-2">
                            <input type="time" class="form-control" id="start_time" name="start_time" required>
                        </div>
                        <label for="end_time" class="col-sm-2 col-form-label">Waktu Selesai</label>
                        <div class="col-sm-2">
                            <input type="time" class="form-control" id="end_time" name="end_time" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <label for="purpose" class="col-sm-2 col-form-label">Tujuan</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="purpose" name="purpose" required></textarea>
                        </div>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a href="#" class="btn btn-secondary me-md-1">Cancel</a>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>


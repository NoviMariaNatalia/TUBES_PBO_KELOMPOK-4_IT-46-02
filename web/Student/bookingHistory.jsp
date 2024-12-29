<%-- 
    Document   : bookingHistory
    Created on : 26 Dec 2024, 16.00.19
    Author     : USER
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Booking History</title>
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

<% if(request.getParameter("message") != null) { %>
    <div class="alert alert-info"><%= request.getParameter("message") %></div>
<% } %>

<div class="container mt-3">
    <div class="row">
        <div class="card shadow p-3 mb-5">
            <div class="card-body">
                <h3>Riwayat Peminjaman</h3>
                <table class="table table-bordered mt-4">
                    <thead>
                        <tr class="table-dark">
                            <th scope="col" class="text-center">Ruangan</th>
                            <th scope="col" class="text-center">Gedung</th>
                            <th scope="col" class="text-center">Tanggal Mulai</th>
                            <th scope="col" class="text-center">Tanggal Selesai</th>
                            <th scope="col" class="text-center">Waktu Mulai</th>
                            <th scope="col" class="text-center">Waktu Selesai</th>
                            <th scope="col" class="text-center">Tujuan</th>
                            <th scope="col" class="text-center">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            DatabaseConnection db = new DatabaseConnection();
                            String query = "SELECT b.*, r.name as room_name, bg.name as building_name FROM bookings b " +
                                           "JOIN rooms r ON b.room_id = r.id " +
                                           "JOIN buildings bg ON r.building_id = bg.id " +
                                           "WHERE b.user_id = " + session.getAttribute("userId");
                            ResultSet rs = db.getData(query);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("room_name")%></td>
                            <td><%= rs.getString("building_name")%></td>
                            <td><%= rs.getString("start_date")%></td>
                            <td><%= rs.getString("end_date")%></td>
                            <td><%= rs.getString("start_time")%></td>
                            <td><%= rs.getString("end_time")%></td>
                            <td><%= rs.getString("purpose")%></td>
                            <td><%= rs.getString("status")%></td>
                        </tr>
                        <%
                            }
                            db.disconnect();
                        %>
                    </tbody>
                </table>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="/studentDashboard.jsp" class="btn btn-primary">Selesai</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


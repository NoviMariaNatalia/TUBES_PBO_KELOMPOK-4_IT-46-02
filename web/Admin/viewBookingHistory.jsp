<%-- 
    Document   : viewBookingHistory
    Created on : Dec 28, 2024, 12:16:13 AM
    Author     : Nadhif Ahmad Mutawakkil Zaidan
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Riwayat Pemesanan</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }
            th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
        </style>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="adminDashboard.jsp">Dashboard Admin</a>
            </div>
        </nav>

        <h1>Booking History</h1>

        <% if (request.getParameter("message") != null) {%>
        <p><%= request.getParameter("message")%></p>
        <% } %>

        <table>
            <tr>
                <th>Requester</th>
                <th>Room</th>
                <th>Building</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Start Time</th>
                <th>End Time</th>
                <th>Purpose</th>
                <th>Status</th>
            </tr>
            <%
                DatabaseConnection db = new DatabaseConnection();
                String query = "SELECT b.*, u.username, r.name as room_name, "
                        + "bg.name as building_name "
                        + "FROM bookings b "
                        + "JOIN users u ON b.user_id = u.id "
                        + "JOIN rooms r ON b.room_id = r.id "
                        + "JOIN buildings bg ON r.building_id = bg.id "
                        + "WHERE b.status IN ('accepted', 'rejected') "
                        + "ORDER BY b.start_date, b.start_time";

                ResultSet rs = db.getData(query);
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("username")%></td>
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
        </table>

        <p><a href="adminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a></p>
    </body>
</html>


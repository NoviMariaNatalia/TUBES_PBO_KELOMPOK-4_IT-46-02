<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Database.DatabaseConnection, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Requests</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <h1>Pending Booking Requests</h1>
    
    <% if(request.getParameter("message") != null) { %>
        <p><%= request.getParameter("message") %></p>
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
            <th>Action</th>
        </tr>
        <%
            DatabaseConnection db = new DatabaseConnection();
            String query = "SELECT b.*, u.username, r.name as room_name, " +
                         "bg.name as building_name " +
                         "FROM bookings b " +
                         "JOIN users u ON b.user_id = u.id " +
                         "JOIN rooms r ON b.room_id = r.id " +
                         "JOIN buildings bg ON r.building_id = bg.id " +
                         "WHERE b.status = 'pending' " +
                         "ORDER BY b.start_date, b.start_time";
            
            ResultSet rs = db.getData(query);
            while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("room_name") %></td>
                <td><%= rs.getString("building_name") %></td>
                <td><%= rs.getString("start_date") %></td>
                <td><%= rs.getString("end_date") %></td>
                <td><%= rs.getString("start_time") %></td>
                <td><%= rs.getString("end_time") %></td>
                <td><%= rs.getString("purpose") %></td>
                <td>
                    <form action="../AdminBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                        <input type="hidden" name="status" value="accepted">
                        <input type="submit" value="Accept">
                    </form>
                    <form action="../AdminBookingServlet" method="post" style="display:inline;">
                        <input type="hidden" name="bookingId" value="<%= rs.getInt("id") %>">
                        <input type="hidden" name="status" value="rejected">
                        <input type="submit" value="Reject">
                    </form>
                </td>
            </tr>
        <%
            }
            db.disconnect();
        %>
    </table>
    
    <p><a href="adminDashboard.jsp">Back to Dashboard</a></p>
</body>
</html>

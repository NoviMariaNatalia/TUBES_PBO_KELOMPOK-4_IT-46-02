<%-- 
    Document   : viewBulidingList
    Created on : Dec 26, 2024, 3:54:39 PM
    Author     : ahmad
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="Database.DatabaseConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Buildings List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }
        .buildings-container {
            max-width: 1000px;
            margin: 20px auto;
        }
        .building-card {
            background-color: #f5f5f5;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            gap: 20px;
        }
        .building-image {
            width: 200px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }
        .building-info {
            flex: 1;
        }
        .building-info h3 {
            margin-top: 0;
            color: #333;
        }
        .view-rooms-btn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
        }
        .view-rooms-btn:hover {
            background-color: #1976D2;
        }
        .back-btn {
            display: inline-block;
            padding: 8px 16px;
            background-color: #666;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .back-btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="buildings-container">
        <a href="studentDashboard.jsp" class="back-btn">Back to Dashboard</a>
        <h1>Available Buildings</h1>
        
        <%
            DatabaseConnection db = new DatabaseConnection();
            try {
                String query = "SELECT * FROM buildings";
                ResultSet rs = db.getData(query);
                
                while(rs.next()) {
        %>
                <div class="building-card">
                    <img src="<%= rs.getString("photo") %>" alt="<%= rs.getString("name") %>" class="building-image">
                    <div class="building-info">
                        <h3><%= rs.getString("name") %></h3>
                        <p><strong>Address:</strong> <%= rs.getString("address") %></p>
                        <a href="viewRoomList.jsp?buildingId=<%= rs.getInt("id") %>" class="view-rooms-btn">View Rooms</a>
                    </div>
                </div>
        <%
                }
            } catch(Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                db.disconnect();
            }
        %>
    </div>
</body>
</html>

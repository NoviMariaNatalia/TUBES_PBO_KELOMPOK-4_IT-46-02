/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import Database.DatabaseConnection;
import Model.Room;

/**
 *
 * @author Novi Maria Natalia
 */

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        DatabaseConnection db = new DatabaseConnection();
        
        try {
            switch (action) {
                case "add":
                    addRoom(request, response, db);
                    break;
                case "edit":
                    editRoom(request, response, db);
                    break;
                case "delete":
                    deleteRoom(request, response, db);
                    break;
            }
        } finally {
            db.disconnect();
        }
    }
    
    private void addRoom(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            Room room = new Room(
                Integer.parseInt(request.getParameter("buildingId")),
                request.getParameter("name"),
                Integer.parseInt(request.getParameter("floor")),
                Integer.parseInt(request.getParameter("capacity")),
                request.getParameter("facilities"),
                request.getParameter("photo")
            );
            
            String query = "INSERT INTO rooms (building_id, name, floor, capacity, facilities, photo) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setInt(1, room.getBuildingId());
            pst.setString(2, room.getName());
            pst.setInt(3, room.getFloor());
            pst.setInt(4, room.getCapacity());
            pst.setString(5, room.getFacilities());
            pst.setString(6, room.getPhoto());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Room added successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
    
    private void editRoom(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            Room room = new Room(
                Integer.parseInt(request.getParameter("id")),
                Integer.parseInt(request.getParameter("buildingId")),
                request.getParameter("name"),
                Integer.parseInt(request.getParameter("floor")),
                Integer.parseInt(request.getParameter("capacity")),
                request.getParameter("facilities"),
                request.getParameter("photo")
            );
            
            String query = "UPDATE rooms SET building_id=?, name=?, floor=?, capacity=?, facilities=?, photo=? WHERE id=?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setInt(1, room.getBuildingId());
            pst.setString(2, room.getName());
            pst.setInt(3, room.getFloor());
            pst.setInt(4, room.getCapacity());
            pst.setString(5, room.getFacilities());
            pst.setString(6, room.getPhoto());
            pst.setInt(7, room.getId());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Room updated successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
    
    private void deleteRoom(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            Room room = new Room(Integer.parseInt(request.getParameter("id")));
            
            String query = "DELETE FROM rooms WHERE id=?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setInt(1, room.getId());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Room deleted successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
}

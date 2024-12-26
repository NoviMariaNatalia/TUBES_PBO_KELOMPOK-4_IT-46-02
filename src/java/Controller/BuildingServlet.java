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
import Model.Building;

/**
 *
 * @author Novi Maria Natalia
 */

@WebServlet("/BuildingServlet")
public class BuildingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        DatabaseConnection db = new DatabaseConnection();
        
        try {
            switch (action) {
                case "add":
                    addBuilding(request, response, db);
                    break;
                case "edit":
                    editBuilding(request, response, db);
                    break;
                case "delete":
                    deleteBuilding(request, response, db);
                    break;
            }
        } finally {
            db.disconnect();
        }
    }
    
    private void addBuilding(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            Building building = new Building(
                request.getParameter("name"),
                request.getParameter("address"),
                request.getParameter("photo")
            );
            
            String query = "INSERT INTO buildings (name, address, photo) VALUES (?, ?, ?)";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setString(1, building.getName());
            pst.setString(2, building.getAddress());
            pst.setString(3, building.getPhoto());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Building added successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
    
    private void editBuilding(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            Building building = new Building(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("address"),
                request.getParameter("photo")
            );
            
            String query = "UPDATE buildings SET name=?, address=?, photo=? WHERE id=?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setString(1, building.getName());
            pst.setString(2, building.getAddress());
            pst.setString(3, building.getPhoto());
            pst.setInt(4, building.getId());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Building updated successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
    
    private void deleteBuilding(HttpServletRequest request, HttpServletResponse response, DatabaseConnection db)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Building building = new Building(id);
            
            String query = "DELETE FROM buildings WHERE id=?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setInt(1, building.getId());
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBuildings.jsp?message=Building deleted successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBuildings.jsp?message=Error: " + e.getMessage());
        }
    }
}

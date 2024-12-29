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

/**
 *
 * @author USER
 */
@WebServlet("/AdminBookingServlet")
public class AdminBookingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Validasi session dan role
        String role = (String) request.getSession().getAttribute("role");
        if (role == null || !role.equals("admin")) {
            response.sendRedirect("../login.jsp?message=Akses ditolak.");
            return;
        }
        
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String status = request.getParameter("status"); // 'accepted' or 'rejected'
        
        DatabaseConnection db = new DatabaseConnection();
        
        try {
            String query = "UPDATE bookings SET status = ? WHERE id = ?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setString(1, status);
            pst.setInt(2, bookingId);
            pst.executeUpdate();
            
            response.sendRedirect("Admin/viewBookingRequests.jsp?message=Booking " + status + " successfully");
        } catch (Exception e) {
            response.sendRedirect("Admin/viewBookingRequests.jsp?message=Error: " + e.getMessage());
        } finally {
            db.disconnect();
        }
    }
}

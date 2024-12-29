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
@WebServlet("/StudentViewServlet")
public class StudentViewServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        // Validasi session dan role
            String role = (String) request.getSession().getAttribute("role");
            if (role == null || !role.equals("mahasiswa")) {
                response.sendRedirect("../login.jsp?message=Akses ditolak.");
                return;
            }

            DatabaseConnection db = new DatabaseConnection();

        try {
            String action = request.getParameter("action");
            if ("viewRooms".equals(action)) {
                // Validasi parameter gedung
                int buildingId = Integer.parseInt(request.getParameter("buildingId"));
                if (buildingId <= 0) {
                    request.setAttribute("message", "Gedung tidak valid.");
                    request.getRequestDispatcher("/Student/studentDashboard.jsp").forward(request, response);
                    return;
                }

                // Query untuk menampilkan ruangan
                String query = "SELECT * FROM rooms WHERE building_id = ?";
                PreparedStatement pst = db.prepareStatement(query);
                pst.setInt(1, buildingId);
                ResultSet rs = pst.executeQuery();

                request.setAttribute("roomList", rs);
                request.getRequestDispatcher("/Student/viewRoomList.jsp").forward(request, response);
            } else {
                // Query untuk menampilkan gedung
                String query = "SELECT * FROM buildings";
                ResultSet rs = db.getData(query);
                
                request.setAttribute("buildingList", rs);
                request.getRequestDispatcher("/Student/viewBuildingList.jsp").forward(request, response);
            }
        } catch (Exception e) {
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("/Student/studentDashboard.jsp").forward(request, response);
        } finally {
            db.disconnect();
        }
    }
}

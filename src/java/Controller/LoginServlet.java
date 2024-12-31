package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Database.DatabaseConnection;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        DatabaseConnection db = new DatabaseConnection();
        try {
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement pst = db.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", rs.getString("role")); // Assuming role is stored in the users table
                
                // Redirect based on user role
                String role = rs.getString("role");
                if ("admin".equals(role)) {
                    response.sendRedirect("Admin/adminDashboard.jsp"); // Redirect to admin dashboard
                } else {
                    response.sendRedirect("Student/studentDashboard.jsp"); // Redirect to student dashboard
                }
            } else {
                response.sendRedirect("login.jsp?message=Invalid username or password");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?message=Error: " + e.getMessage());
        } finally {
            db.disconnect();
        }
    }
}

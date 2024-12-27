import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Mengambil parameter dari form
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        String start_time = request.getParameter("start_time");
        String end_time = request.getParameter("end_time");
        String purpose = request.getParameter("purpose");

        try {
            // Koneksi ke database
            String jdbcURL = "jdbc:mysql://localhost:3306/nspace_PBO";
            String jdbcUsername = "root";
            String jdbcPassword = "";
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            // Query SQL
            String sql = "INSERT INTO bookings (user_id, room_id, start_date, end_date, start_time, end_time, purpose) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, 1); // Simpan `user_id` sebagai contoh statis (anda bisa menggantinya dengan session login)
            ps.setInt(2, room_id);
            ps.setString(3, start_date);
            ps.setString(4, end_date);
            ps.setString(5, start_time);
            ps.setString(6, end_time);
            ps.setString(7, purpose);

            ps.executeUpdate();
            ps.close();
            conn.close();

            // Redirect ke halaman sukses
            response.sendRedirect("bookingHistory.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Student/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        String buildingName = request.getParameter("building_id"); // Nama gedung dari input
        String roomName = request.getParameter("name");           // Nama ruang dari input

        String jdbcURL = "jdbc:mysql://localhost:3306/nspace_PBO";
        String jdbcUsername = "root";
        String jdbcPassword = "";

        StringBuilder results = new StringBuilder();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "SELECT rooms.id AS room_id, buildings.name AS building_name, rooms.name AS room_name " +
                         "FROM rooms " +
                         "JOIN buildings ON rooms.building_id = buildings.id " +
                         "WHERE buildings.name LIKE ? AND (rooms.name LIKE ? OR ? = '')";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, buildingName != null ? "%" + buildingName + "%" : "");
            statement.setString(2, roomName != null ? "%" + roomName + "%" : "");
            statement.setString(3, roomName != null ? roomName : "");

            System.out.println("Executing query: " + statement);

            ResultSet rs = statement.executeQuery();

            results.append("<table class='table'><thead><tr><th>ID</th><th>Gedung</th><th>Ruangan</th></tr></thead><tbody>");
            boolean hasResults = false;
            while (rs.next()) {
                hasResults = true;
                results.append("<tr>");
                results.append("<td>").append(rs.getInt("room_id")).append("</td>");
                results.append("<td>").append(rs.getString("building_name")).append("</td>");
                results.append("<td>").append(rs.getString("room_name")).append("</td>");
                results.append("</tr>");
            }
            results.append("</tbody></table>");

            if (!hasResults) {
                results.append("<p>Tidak ada ruangan yang ditemukan untuk gedung '").append(buildingName)
                       .append("' dan nama ruangan '").append(roomName).append("'.</p>");
            }

            rs.close();
            statement.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            results.append("<p>Error: ").append(e.getMessage()).append("</p>");
        }

        request.setAttribute("results", results.toString());
        request.getRequestDispatcher("/Student/searchRoom.jsp").forward(request, response);
    }
}

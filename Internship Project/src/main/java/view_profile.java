import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class view_profile
 */
public class view_profile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public view_profile() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");

        try {
            // Load the database driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
            System.out.println("Connected to MYSQL " + con);

            // Prepare SQL query to retrieve user data
            String query = "SELECT * FROM user_register WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            out.println("<html><head><style>");
            out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f9; color: #333; }");
            out.println("h1 { text-align: center; color: #444; }");
            out.println(".container { width: 80%; margin: 20px auto; display: flex; flex-wrap: wrap; justify-content: center; }");
            out.println(".card { background: white; border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); margin: 10px; padding: 20px; width: 300px; }");
            out.println(".card h2 { font-size: 20px; color: #5863f8; margin: 0; }");
            out.println(".card p { margin: 5px 0; }");
            out.println("</style></head><body>");

            out.println("<h1>User Profile</h1>");
            out.println("<div class='container'>");

            // Print each row from the result set
            while (rs.next()) {
                out.println("<div class='card'>");
                out.println("<h2>" + rs.getString("name") + "</h2>"); // Assuming the first column is 'name'
                out.println("<p><strong>Email:</strong> " + rs.getString("email") + "</p>");
                out.println("<p><strong>Username:</strong> " + rs.getString("username") + "</p>");
                out.println("<p><strong>Password:</strong> " + rs.getString("password") + "</p>");
                out.println("<p><strong>Phone No:</strong> " + rs.getString("phone") + "</p>");
                out.println("<p><strong>DOB:</strong> " + rs.getString("dob") + "</p>");
                out.println("<p><strong>Address:</strong> " + rs.getString("address") + "</p>");
                out.println("<p><strong>City:</strong> " + rs.getString("city") + "</p>");
                out.println("<p><strong>State:</strong> " + rs.getString("state") + "</p>");
                out.println("<p><strong>Country:</strong> " + rs.getString("country") + "</p>");
                out.println("<a href='update_profile.jsp'>Edit</a>");
                out.println("</div>");
            }

            out.println("</div>"); // Close container
            out.println("</body></html>");
        } catch (Exception e) {
            System.out.println("exception: " + e);
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
}

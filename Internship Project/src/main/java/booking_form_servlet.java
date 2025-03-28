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
 * Servlet implementation class booking_form_servlet
 */
@WebServlet("/booking")
public class booking_form_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public booking_form_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); // Set response type to HTML
        PrintWriter out = response.getWriter();
        
        String venue = request.getParameter("venue");
        String event = request.getParameter("event");
        String eventdate = request.getParameter("eventdate");
        String people = request.getParameter("people");
        String name = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
  
        try {
            // Step 1: Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Establish a connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
            System.out.println("connected to database");

            // Step 3: Create a statement
           
            PreparedStatement checkDate = con.prepareStatement("SELECT * FROM booking_form WHERE eventdate = ?");
            checkDate.setString(1, eventdate);
            ResultSet rs = checkDate.executeQuery();

            if (rs.next()) {
                // Date exists, show an error message
                out.println("<html>");
                out.println("<head><title>Date Already Booked</title></head>");
                out.println("<body>");
                out.println("<div style='color:red; font-weight:bold; text-align:center; margin-top:20px;'>");
                out.println("Error: The selected date is already booked. Please choose another date.");
                out.println("</div>");
                out.println("</body></html>");
                
            } else {
            
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO booking_form (venue, event, eventdate, size, fullname, phone, email) VALUES (?, ?, ?, ?, ?, ?, ?)");

            
            
            ps.setString(1, venue);
            ps.setString(2, event);
            ps.setString(3, eventdate);
            ps.setString(4, people);
            ps.setString(5, name);
            ps.setString(6, phone);
            ps.setString(7, email);
            
        

            int k = ps.executeUpdate();

            // Styled HTML output
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Booking Confirmation</title>");
            out.println("<style>");
            out.println(".booking-message {");
            out.println("    background-color: #e7f3fe;"); // Light blue background
            out.println("    color: #31708f;"); // Darker blue text
            out.println("    border: 1px solid #bce8f1;"); // Light blue border
            out.println("    padding: 15px;"); // Padding
            out.println("    margin: 20px 0;"); // Margin
            out.println("    border-radius: 5px;"); // Rounded corners
            out.println("    font-size: 1.2em;"); // Larger font size
            out.println("    text-align: center;"); // Centered text
            out.println("}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"booking-message\">");
            out.println("Booking Request Sent");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
            }  
        } catch (Exception e) {
            System.out.println("exception " + e);
        }
         }
   

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

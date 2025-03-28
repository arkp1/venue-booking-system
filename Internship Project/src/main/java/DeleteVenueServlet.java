

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Servlet implementation class DeleteVenueServlet
 */
public class DeleteVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteVenueServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		String venue = request.getParameter("venueName");
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
			System.out.println("Connected to MYSQL"+con);	
			String sql = "delete from book_venue where name = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, venue);
			
			int k = ps.executeUpdate();
			if (k > 0) {
			    out.println("<div style='font-family: Arial, sans-serif; color: #28a745; background-color: #d4edda; padding: 10px; border-radius: 5px; margin: 10px 0; border: 1px solid #c3e6cb;'>");
			    out.println("Deleted successfully");
			    out.println("</div>");
			} else {
			    out.println("<div style='font-family: Arial, sans-serif; color: #721c24; background-color: #f8d7da; padding: 10px; border-radius: 5px; margin: 10px 0; border: 1px solid #f5c6cb;'>");
			    out.println("Something went wrong...check again");
			    out.println("</div>");
			}
		}
		
		catch (Exception e) {
			System.out.println("exception: "+e);
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

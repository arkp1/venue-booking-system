

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

/**
 * Servlet implementation class update_profile_servlet
 */
public class update_profile_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_profile_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String password = request.getParameter("password"); // Using password as unique identifier

		// Convert empty strings to null
		name = (name != null && name.isEmpty()) ? null : name;
		email = (email != null && email.isEmpty()) ? null : email;
		username = (username != null && username.isEmpty()) ? null : username;
		phone = (phone != null && phone.isEmpty()) ? null : phone;
		dob = (dob != null && dob.isEmpty()) ? null : dob;
		address = (address != null && address.isEmpty()) ? null : address;
		city = (city != null && city.isEmpty()) ? null : city;
		state = (state != null && state.isEmpty()) ? null : state;
		country = (country != null && country.isEmpty()) ? null : country;

		try {
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");

		    String query = """
		        UPDATE user_register 
		        SET 
		            name = COALESCE(?, name),
		            email = COALESCE(?, email),
		            username = COALESCE(?, username),
		            phone = COALESCE(?, phone),
		            dob = COALESCE(?, dob),
		            address = COALESCE(?, address),
		            city = COALESCE(?, city),
		            state = COALESCE(?, state),
		            country = COALESCE(?, country)
		        WHERE password = ?
		    """;

		    PreparedStatement ps = con.prepareStatement(query);

		    // Set the parameters for COALESCE
		    ps.setString(1, name);
		    ps.setString(2, email);
		    ps.setString(3, username);
		    ps.setString(4, phone);
		    ps.setString(5, dob);
		    ps.setString(6, address);
		    ps.setString(7, city);
		    ps.setString(8, state);
		    ps.setString(9, country);
		    ps.setString(10, password); // For the WHERE clause

		    int rowsUpdated = ps.executeUpdate();
		    if (rowsUpdated > 0) {
		        out.println("<div style='"
		            + "background-color: #d4edda; "
		            + "color: #155724; "
		            + "border: 1px solid #c3e6cb; "
		            + "padding: 15px; "
		            + "border-radius: 5px; "
		            + "margin: 10px 0; "
		            + "font-family: Arial, sans-serif; "
		            + "font-size: 16px;'>"
		            + "Details updated successfully!" //Message
		            + "</div>");
		    } else {
		        out.println("<div style='"
		            + "background-color: #f8d7da; "
		            + "color: #721c24; "
		            + "border: 1px solid #f5c6cb; "
		            + "padding: 15px; "
		            + "border-radius: 5px; "
		            + "margin: 10px 0; "
		            + "font-family: Arial, sans-serif; "
		            + "font-size: 16px;'>"
		            + "User update failed!" //Message
		            + "</div>");
		    }


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

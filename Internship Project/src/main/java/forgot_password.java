

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
 * Servlet implementation class forgot_password
 */
public class forgot_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgot_password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    PrintWriter out = response.getWriter();
	    
	    String email = request.getParameter("email");
	    String dob = request.getParameter("dob");
	    
	    System.out.println("<html><body>");
	    
	    try 
		{
		//step 1	
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		//step 2
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro","root","root");
		
		System.out.println("connected to oracle");
		
		PreparedStatement ps=con.prepareStatement("select * from user_register where email = ? and dob = ?");
		
		ps.setString(1, email);
		ps.setString(2, dob);
		
		ResultSet rs = ps.executeQuery();
		
	    if (rs.next()) {
            // Email and DOB match found
	    	 request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
            // You can forward to another page here or perform additional logic
        else {
            // No match found
        	response.getWriter().println("<div style='color: red; font-size: 18px; padding: 10px; margin-top: 20px; border: 1px solid #f5c6cb; background-color: #f8d7da; border-radius: 5px;'>"
        		    + "Login Failed! Email or Date of Birth is incorrect." + "</div>");

        }
	    
	}
	    catch (Exception e) 
	    {
	    	System.out.println("excetion: "+e);
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



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
 * Servlet implementation class change_password
 */
public class change_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public change_password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String password = request.getParameter("pwd");
		String password1 = request.getParameter("pwd1");
		
		String email = request.getParameter("email");
		
		
		
		if(password.equals(password1)) {
			    try 
				{
				//step 1	
				Class.forName("com.mysql.cj.jdbc.Driver");
			
				//step 2
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro","root","root");
				
				System.out.println("connected to oracle");
				
				PreparedStatement ps=con.prepareStatement("update user_register set password = ? where email = ?");
				
				ps.setString(1, password1);
				ps.setString(2, email);
				
				
				int k = ps.executeUpdate();
				
				out.println("<div style='color: green; font-size: 18px; padding: 10px; margin-top: 20px; border: 1px solid #c3e6cb; background-color: #d4edda; border-radius: 5px;'>"
					    + " password successfully updated" + "</div>");
;
			    
			}
			    catch (Exception e) 
			    {
			    	System.out.println("excetion: "+e);
			    
			}		
		  }
		else {
			out.println("<div style='color: red; font-size: 18px; padding: 10px; margin-top: 20px; border: 1px solid #f5c6cb; background-color: #f8d7da; border-radius: 5px;'>"
				    + "Passwords don't match! Try again." + "</div>");

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

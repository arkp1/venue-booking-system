

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
import java.util.Enumeration;

import com.mysql.cj.jdbc.Blob;

/**
 * Servlet implementation class adminReg
 */
public class adminReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminReg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		String fullname=request.getParameter("fullname");
	    String username=request.getParameter("username");
	    String password=request.getParameter("pwd");
	    String email=request.getParameter("mail");
	    String phone= request.getParameter("phn");
//	    Blob profile=request.geti
	
		out.print("<html><body>");
	
		try 
		{
		//step 1	
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		//step 2
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro","root","root");
		
		System.out.println("connected to oracle");
		
		PreparedStatement ps=con.prepareStatement("insert into admin values (?,?,?,?,?)");	
	
	    ps.setString(1, fullname);
	    ps.setString(2, username);
	    ps.setString(3, password);
	    ps.setString(4, email);
	    ps.setString(5, phone);
//	    ps.setString(1, fullname);
	    
	    ps.executeUpdate();
	    ;
		out.println("registered successfully");
		out.println("</html></body>");
	    }
		catch(Exception e1) 
		{
		 System.out.println("exception "+e1);
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

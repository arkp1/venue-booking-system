

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
 * Servlet implementation class user_login_servlet
 */
public class user_login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		//get the data
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//connect to db
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
			System.out.println("Connected to MYSQL"+con);
			String log = "select * from user_register where username=? and password=?";
			PreparedStatement ps = con.prepareStatement(log);
			ps.setString(1, username);
			ps.setString(2, password);
			//execute
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				response.sendRedirect("venue_booking_list.jsp");
				}
			else
			{
				out.print("<!DOCTYPE html>\r\n"
						+ "<html lang=\"en\">\r\n"
						+ "<head>\r\n"
						+ "    <meta charset=\"UTF-8\">\r\n"
						+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
						+ "    <title>Registration Successful</title>\r\n"
						+ "    <style>\r\n"
						+ "        body {\r\n"
						+ "            font-family: Arial, sans-serif;\r\n"
						+ "            background-color: #f4f4f4;\r\n"
						+ "            margin: 0;\r\n"
						+ "            padding: 0;\r\n"
						+ "            display: flex;\r\n"
						+ "            justify-content: center;\r\n"
						+ "            align-items: center;\r\n"
						+ "            height: 100vh;\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        .container {\r\n"
						+ "            background-color: white;\r\n"
						+ "            padding: 20px;\r\n"
						+ "            border-radius: 8px;\r\n"
						+ "            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);\r\n"
						+ "            text-align: center;\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        h1 {\r\n"
						+ "            color: #df4881;\r\n"
						+ "            margin-bottom: 20px;\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        p {\r\n"
						+ "            font-size: 16px;\r\n"
						+ "            color: #333;\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        .login-button {\r\n"
						+ "            display: inline-block;\r\n"
						+ "            padding: 10px 20px;\r\n"
						+ "            font-size: 16px;\r\n"
						+ "            background-color: #df4881;\r\n"
						+ "            color: white;\r\n"
						+ "            border: none;\r\n"
						+ "            border-radius: 5px;\r\n"
						+ "            text-decoration: none;\r\n"
						+ "            margin-top: 20px;\r\n"
						+ "            cursor: pointer;\r\n"
						+ "        }\r\n"
						+ "\r\n"
						+ "        .login-button:hover {\r\n"
						+ "            background-color: #df4881;\r\n"
						+ "        }\r\n"
						+ "    </style>\r\n"
						+ "</head>\r\n"
						+ "<body>\r\n"
						+ "    <div class=\"container\">\r\n"
						+ "        <h1>Login Failed...</h1>\r\n"
						+ "        <p>Please Check username or password and login again...</p>\r\n"
						+ "        <a href=\"user_login.jsp\" class=\"login-button\">Login</a>\r\n"
						+ "    </div>\r\n"
						+ "</body>\r\n"
						+ "</html>\r\n"
						+ "");
				
			}
			
		}
		catch(Exception e) {
			System.out.println("Problem"+e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

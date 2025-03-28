

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
 * Servlet implementation class users_register_servlet
 */
public class users_register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public users_register_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		//get data from user register
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		//connect to database
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
			System.out.println("Connected to MYSQL"+con);
			String reg = "insert into user_register values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(reg);
			//set ?
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, username);
			ps.setString(4, password);
			ps.setString(5, phone);
			ps.setString(6, dob);
			ps.setString(7, address);
			ps.setString(8, city);
			ps.setString(9, state);
			ps.setString(10, country);

			int k = ps.executeUpdate();
			if(k>0) {
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
						+ "            color:#df4881;\r\n"
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
						+ "        <h1>Registration Successful!</h1>\r\n"
						+ "        <p>Thank you for registering. Your account has been created successfully.</p>\r\n"
						+ "        <a href=\"user_login.jsp\" class=\"login-button\">Login</a>\r\n"
						+ "    </div>\r\n"
						+ "</body>\r\n"
						+ "</html>\r\n"
						+ "");
			}
			else {
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
						+ "        <h1>Something Went wrong...!</h1>\r\n"
						+ "        <p>please check the details and register again...</p>\r\n"
						+ "        <a href=\"user_register.jsp\" class=\"login-button\">Login</a>\r\n"
						+ "    </div>\r\n"
						+ "</body>\r\n"
						+ "</html>\r\n"
						+ "");
			}
		}

					catch(Exception e) {
						System.out.println("problem "+e);
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


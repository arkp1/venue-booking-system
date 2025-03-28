

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class serv
 */
//This is the annotation-based
//mapping URL to Servlet.
@WebServlet("/Serv")

//This annotation defines the maximum
//file size which can be taken.
@MultipartConfig(maxFileSize = 16177215)
public class manage_venue_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public manage_venue_servlet() {
        super();
       
    }
 
 // This Method takes in All the information
 	// required and is used to store in the
 	// MySql Database.
 	public int uploadFile(String name,String contact,String venuecost,String foodcost,String capacity,String address,String service,String description,InputStream profilephoto)
 	{
 		String sql= "insert into book_venue (name, contact, venuecost, foodcost, capacity, address, service, description, profilephoto) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
 		int row = 0;
    try
    {
 	 Class.forName("com.mysql.jdbc.Driver");
 	 Connection connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro","root","root");
 	 PreparedStatement preparedStatement;
 			preparedStatement= connection.prepareStatement(sql);
 			preparedStatement.setString(1, name);
 			preparedStatement.setString(2, contact);
 			preparedStatement.setString(3, venuecost);
 			preparedStatement.setString(4, foodcost);
 			preparedStatement.setString(5, capacity);
 			preparedStatement.setString(6, address);
 			preparedStatement.setString(7, service);
 			preparedStatement.setString(8, description);
 			preparedStatement.setBlob(9, profilephoto);

 			

 			// Sends the statement to
 			// the database server
 			row = preparedStatement.executeUpdate();
 		}
 		catch (Exception e) {
 			System.out.println(e.getMessage());
 		}

 		return row;
 	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		// Getting the parameters from web page
			String venueName = request.getParameter("venueName");
			String venue_contact = request.getParameter("venue_contact");
			String venue_cost = request.getParameter("venue_cost");
			String food_cost = request.getParameter("food_cost");
			String capacity = request.getParameter("capacity");
			String address = request.getParameter("address");
			String service = request.getParameter("service");
			String description = request.getParameter("description");
			

				// Input stream of the upload file
				InputStream inputStream = null;

				String message = null;

				// Obtains the upload file
				// part in this multipart request
				Part filePart= request.getPart("photo");

				if (filePart != null) {

					// Prints out some information
					// for debugging
					System.out.println(filePart.getName());
					System.out.println(filePart.getSize());
					System.out.println(filePart.getContentType());

					// Obtains input stream of the upload file
					inputStream	= filePart.getInputStream();
				}

				// Sends the statement to the  database server
			
				int row= uploadFile(venueName,venue_contact,venue_cost, food_cost, capacity, address, service, description, inputStream);
				if (row > 0) {
					out.print("<h1>Details uploaded sucessfully</h1>");
				}
				
	}

}

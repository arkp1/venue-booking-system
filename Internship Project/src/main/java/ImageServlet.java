

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public ImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int venueId = Integer.parseInt(request.getParameter("id"));
		 try
		    {
		 	 Class.forName("com.mysql.jdbc.Driver");
		 	 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro","root","root");
		 	String sql = "SELECT profilephoto FROM book_venue WHERE id = ?";
		 	PreparedStatement ps = con.prepareStatement(sql);
		 	ps.setInt(1, venueId);
		 	ResultSet rs = ps.executeQuery();
		 	
		 	if(rs.next()) {
		 		 byte[] imgData = rs.getBytes("profilephoto"); // Retrieve the image as bytes
		 		 response.setContentType("image/jpeg");
		 		 OutputStream outputStream = response.getOutputStream();
	                outputStream.write(imgData);
	                outputStream.close();
		 	}
		    
		    }
		 catch (Exception e) {
			// TODO: handle exception
			 System.out.println("Problem "+e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

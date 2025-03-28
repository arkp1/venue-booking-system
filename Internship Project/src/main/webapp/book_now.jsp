<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Venue Details</title>
    <form action="booking_form.jsp" method="post">
    <style>
      body {
    font-family: sans-serif;
    margin: 0;
    padding: 20px;
    background-color: #f9f9f9; /* Light background for better contrast */
}

.venue-card {
    background-color: #fff; /* White background for the card */
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    padding: 20px;
    max-width: 700px; /* Limit the card width */
    margin: 0 auto; /* Center the card */
}

.venue-card h2 { /* Updated this selector to target the heading correctly */
    text-align: center; /* Centering the heading */
    margin-bottom: 20px;
    color: #333; /* Darker text for headings */
}

.venue-image {
    width: 100%;
    max-width: 500px;
    margin: 0 auto 20px auto; /* Center the image */
}

.venue-image img {
    display: block;
    width: 100%;
    border-radius: 5px;
    object-fit: cover; /* Maintain aspect ratio without cut-off */
    height: auto; /* Responsive height */
}

.venue-info {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    width: 100%;
}

.venue-info p {
    flex: 1 0 45%;
    margin-bottom: 10px;
    padding: 10px;
    background-color: #f0f0f0; /* Light background for info sections */
    border-radius: 4px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05); /* Light shadow for separation */
}

.venue-info p strong {
    display: block;
    margin-bottom: 5px;
}

button {
    background-color: #007bff; /* Button color */
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.3s; /* Transition effects */
    margin: 20px auto 0; /* Center the button */
    display: block; /* Centering */
}

button:hover {
    background-color: #0056b3; /* Darker blue on hover */
    transform: scale(1.05); /* Slight zoom effect on hover */
}

    </style>
</head>
<body>
<%
    String venueId = request.getParameter("id"); // Get the ID from the URL parameter
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    if (venueId != null && !venueId.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
            
            // Use the venueId parameter in the SQL query
            ps = con.prepareStatement("SELECT * FROM book_venue WHERE id = ?");
            ps.setString(1, venueId);
            rs = ps.executeQuery();
            
            // Display details of the specific venue
            if (rs.next()) {
%>
                <div class="venue-card">
                    <h2 class="venue-details">Venue Details</h2> <!-- Added class for consistency -->
                    <div class="venue-image">
                        <img src="ImageServlet?id=<%= rs.getString("id") %>" alt="Venue Image">
                    </div>
                    <div class="venue-info">
                        <p><strong>Name:</strong> <%= rs.getString("name") %></p>
                        <p><strong>Contact:</strong> <%= rs.getString("contact") %></p>
                        <p><strong>Venue Cost:</strong> <%= rs.getString("venuecost") %></p>
                        <p><strong>Food Cost:</strong> <%= rs.getString("foodcost") %></p>
                        <p><strong>Capacity:</strong> <%= rs.getString("capacity") %></p>
                        <p><strong>Address:</strong> <%= rs.getString("address") %></p>
                        <p><strong>Service:</strong> <%= rs.getString("service") %></p>
                        <p><strong>Description:</strong> <%= rs.getString("description") %></p>                     
                    </div>
                    <button>Book Now</button>
                </div>
<%
            } else {
                out.println("<p>Venue not found.</p>");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
            if (con != null) try { con.close(); } catch (SQLException ignore) {}
        }
    } else {
        out.println("<p>Invalid venue ID.</p>");
    }
%>
</form>
</body>
</html>

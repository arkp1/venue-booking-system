<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings / home</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
  @charset "UTF-8";
body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

.search-container {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.search-bar {
    width: 60%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

.search-button {
    padding: 10px 20px;
    margin-left: 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.search-button:hover {
    background-color: #0056b3;
}

.student-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.student-table th, .student-table td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.student-table th {
    background-color: #f8f9fa;
    color: #333;
}

.student-table tr:nth-child(even) {
    background-color: #f2f2f2;
}
  
   .btn {
   margin-left:5px;
            padding:10px 10px;
            font-size: 1.2em;
            color: white;
            background-color: orange;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #ff6518a9;
        }
  
  </style>
</head>
<body>
<!-- previous Student Enrollment Data -->

    <div class="container">
        <h1>Manage Bookings</h1>
        
        <form action="search_users.jsp">
        
        <div class="search-container">
            <input type="text" placeholder="Search by ID" class="search-bar" name="search">
            <button class="search-button"><i style="font-size:20px;" class="fa-solid fa-magnifying-glass"></i></button>
        </div>
        
        </form>
        
        <table class="student-table">
            <thead>
                <tr>
                    <th>Booking id</th>
                    <th>Venue name</th>
                    <th>Event Type</th> 
                    <th>Event Date</th>         
                    <th>Attendees</th>
                    <th>Customer Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            
             <%
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
    	System.out.println("Connected to MYSQL"+con);
    	PreparedStatement ps = con.prepareStatement("select * from booking_form");
    	ResultSet rs = ps.executeQuery();
    	while(rs.next()){
    		%><tr>
    		<td><%=rs.getString(1) %></td>
    		<td><%=rs.getString(2) %></td>
    		<td><%=rs.getString(3) %></td>
    		<td><%=rs.getString(4) %></td>
    		<td><%=rs.getString(5) %></td>
    		<td><%=rs.getString(6) %></td>
    		
    		
    		
    		<td>
<a href="update.jsp" style="text-decoration: none; color: #34ff0c; font-size:20px; margin:5px; border-radius: 5px;"><i class="fa-solid fa-pen"></i></a>
<a href="delete_booking.jsp" style="text-decoration: none;color: #ff1861; font-size:20px; margin-left:10px;border-radius: 5px;"><i class="fa-solid fa-trash"></i></a>
                    </td>
      		</tr>	<%
    }
    	}catch(Exception e) {
    				System.out.println("problem "+e);
    			}
    
    %>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
       <!--    <tbody>
                <tr>
                
              
                    <td>1</td>
                    <td>John Doe</td>
                    <td>Computer Science</td>
                    <td>2022-09-10</td>
                    <td>
                        <button class="btn update-btn">Update</button>
                        <button class="btn delete-btn">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>Mathematics</td>
                    <td>2022-09-15</td>
                    <td>
                        <button class="btn update-btn">Update</button>
                        <button class="btn delete-btn">Delete</button>
                    </td>
                </tr>-->
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</body>
</html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage users</title>
 <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
        .table{
        width:100%;
        border-collapse:collapse;
        }
        thead{
        background-color:#df4881;
        color: white;
        }
        th, td{
        border:1px solid #df4881;
        padding: 8px;
        text-align: left;
        }
        
        
        </style>
</head>
<body>
<div class="hero">
        <nav>
            <h1 style="font-size:25px; font-weight: 600; color:#df4881;">Venue Booking</h1>
            <ul>
                <li><a href="HomePage.html">Home</a></li>
                <li><a href="admin_pannel.jsp">Recent Bookings</a></li>
                <li><a href="manage_bookings.jsp">Manage Bookings</a></li>
                <li><a href="manage_venue.jsp">Manage Venues</a></li>
                <li><a href="manage_user.jsp">Manage Users</a></li>
                <li><a href="HomePage.html">Logout</a></li>
               
            </ul>
            <div>
            </div>
        </nav>
       <h1 style="text-align: center; font-size: 40px; padding: 2px; color: #df4881;text-decoration: underline; padding: 2px;">Manage Users</h1> 
 
        <table class="table">
            <thead>
                <tr>
                    <th>Fullname</th>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Date of Birth</th>
                    <th>Address</th>
                     <th>City</th>
                      <th>State</th>
                       <th>Country</th>
                        <th>Actions</th>
                </tr>
            </thead>
            
             <%
    try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
    	System.out.println("Connected to MYSQL"+con);
    	PreparedStatement ps = con.prepareStatement("select * from user_register");
    	ResultSet rs = ps.executeQuery();
    	while(rs.next()){
    		%><tr>
    		<td><%=rs.getString(1) %></td>
    		<td><%=rs.getString(2) %></td>
    		<td><%=rs.getString(3) %></td>
    		<td><%=rs.getString(4) %></td>
    		<td><%=rs.getString(5) %></td>
    		<td><%=rs.getString(6) %></td>
    		<td><%=rs.getString(7) %></td>
    		<td><%=rs.getString(8) %></td>
    		
    		
    		
    		<td>
<a href="delete_user.jsp" style="text-decoration: none; color:#df4881; font-size:20px; margin-left:15px;"><i class="fa-solid fa-trash"></i></a>
                    </td>
      		</tr>	<%
    }
    	}catch(Exception e) {
    				System.out.println("problem "+e);
    			}
    
    %>
            
</body>
</html>
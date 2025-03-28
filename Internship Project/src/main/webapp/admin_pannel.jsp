<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.tailwindcss.com"></script>
<style>
    .table {
        width: 100%;
        max-width: 1200px;
        margin: 20px auto;
        border-collapse: collapse;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    thead {
        background-color: #df4881;
        color: white;
        font-weight: bold;
    }
    th, td {
        border: 1px solid #df4881;
        padding: 12px;
        text-align: center;
        font-size: 16px;
    }
    th {
        background-color: #df4881;
        color: #fff;
        text-transform: uppercase;
        letter-spacing: 0.1em;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #ffe0e9;
        transition: background-color 0.3s;
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
    </nav>
    <h1 style="text-align: center; font-size: 40px; padding: 2px; color: #df4881; text-decoration: underline;">Recent Bookings</h1>

    <table class="table">
        <thead>
            <tr>
                <th>Venue</th>
                <th>Event</th>
                <th>Event Date</th>
                <th>Attendees</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Payment method</th>
            </tr>
        </thead>
        <tbody>
            <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
                String sql = "SELECT * FROM booking_form";
                PreparedStatement ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()) {
            %>
            <tr>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
                <td>Offline</td>
            </tr>
            <%
                }
            } catch(Exception e) {
                System.out.println("problem " + e);
            }
            %>
        </tbody>
    </table>
</div>
</body>
</html>

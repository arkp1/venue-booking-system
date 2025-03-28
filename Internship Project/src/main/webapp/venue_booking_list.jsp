<%@page import="java.sql.*"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Venue Booking Lists</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.tailwindcss.com"></script>
<style>
    /* Main Container Styling */
    .hero {
        padding: 20px;
        font-family: Arial, sans-serif;
        color: #333;
        background-color: #f4f4f8;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .hero nav h1 {
        font-size: 25px;
        font-weight: 600;
        color: #df4881;
    }

    .hero nav ul {
        display: flex;
        gap: 20px;
        list-style: none;
    }

    .hero nav ul li a {
        color: #333;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s;
    }

    .hero nav ul li a:hover {
        color: #df4881;
    }

    /* Table Styling */
    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        border-radius: 10px;
    }

    .table thead {
        background-color: #df4881;
    }

    .table thead th {
        padding: 15px;
        color: #fff;
        text-transform: uppercase;
        font-size: 0.9rem;
    }

    .table tbody tr {
        transition: background-color 0.3s;
    }

    .table tbody tr:nth-child(even) {
        background-color: #f8f8f8;
    }

    .table tbody tr:hover {
        background-color: #f1e0e6;
    }

    .table tbody td {
        padding: 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    /* Larger Image Styling for Venue Image Column */
    .table tbody td img {
        width: 150px; /* Increase image size */
        height: auto;
        border-radius: 8px;
    }

    /* Button Styling for Book Link */
    .book-button {
        color: #df4881;
        font-size: 20px;
        text-decoration: none;
        padding: 6px;
    }

</style>
</head>
<body>
<div class="hero">
    <nav>
        <h1>Venue Booking</h1>
        <ul>
            <li><a href="view_profile.jsp">View profile</a></li>
            <li><a href="update_profile.jsp">Manage your profile</a></li>
            <li><a href="HomePage.html">Logout</a></li>
        </ul>
    </nav>

    
    <table class="table">
        <thead>
            <tr>
                <th>Name</th>
                <th>Contact</th>
                <th>Venue Cost</th>
                <th>Food Cost</th>
                <th>Capacity</th>
                <th>Address</th>
                <th>Service</th>
                <th>Description</th>
                <th>Venue Image</th>
                <th>Book This Venue</th>

            </tr>
        </thead>
        <tbody>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
                ps = con.prepareStatement("SELECT * FROM book_venue");
                rs = ps.executeQuery();
                while (rs.next()) {
        %>
            <tr>
              
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><%= rs.getString(7) %></td>
                <td><%= rs.getString(8) %></td>
                <td><%= rs.getString(9) %></td>
                <td><img src="ImageServlet?id=<%= rs.getString(1) %>" alt="Venue Image"></td>
                <td><a href="book_now.jsp?id=<%= rs.getString(1) %>" class="book-button"><i class="fa-solid fa-book"></i></a></td>               
            </tr>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
                if (con != null) try { con.close(); } catch (SQLException ignore) {}
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>

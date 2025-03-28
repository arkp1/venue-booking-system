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
<title>Search result</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    /* Basic table reset */
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
    }

    table.student-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 1em;
        min-width: 600px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Table Header Styling */
    .student-table thead tr {
        background-color: #4CAF50;
        color: #ffffff;
        text-align: left;
    }

    .student-table th, .student-table td {
        padding: 12px 15px;
    }

    /* Table Row Styling */
    .student-table tbody tr:nth-of-type(even) {
        background-color: #f3f3f3;
    }

    .student-table tbody tr:nth-of-type(odd) {
        background-color: #e9e9e9;
    }

    .student-table tbody tr:hover {
        background-color: #d1e7dd;
    }

    /* Table Borders */
    .student-table th, .student-table td {
        border-bottom: 1px solid #ddd;
    }

    /* Text Styling */
    .student-table th {
        font-weight: bold;
        text-transform: uppercase;
    }

    .student-table td {
        color: #333;
    }

    /* Responsive Styling */
    @media screen and (max-width: 768px) {
        .student-table thead {
            display: none;
        }

        .student-table, .student-table tbody, .student-table tr, .student-table td {
            display: block;
            width: 100%;
        }

        .student-table tr {
            margin-bottom: 15px;
        }

        .student-table td {
            text-align: right;
            padding-left: 50%;
            position: relative;
        }

        .student-table td::before {
            content: attr(data-label);
            position: absolute;
            left: 10px;
            font-weight: bold;
            text-transform: uppercase;
        }
    }
</style>
</head>
<body>

<table class="student-table">
    <thead>
        <tr>
            <th>ID</th>
            <th>Venue Name</th>
            <th>Event</th>
            <th>Event Date</th>
            <th>Attendees</th>
            <th>Customer Name</th>
        </tr>
    </thead>
    <tbody>
        <%
        // Get the data
        String search = request.getParameter("search");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eventpro", "root", "root");
            System.out.println("Connected to MYSQL" + con);
            String sql = "select * from booking_form where id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, search);
            // Execute
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
        %>
        <tr>
            <td data-label="ID"><%= rs.getString(1) %></td>
            <td data-label="Venue Name"><%= rs.getString(2) %></td>
            <td data-label="Event"><%= rs.getString(3) %></td>
            <td data-label="Event Date"><%= rs.getString(4) %></td>
            <td data-label="Attendees"><%= rs.getString(5) %></td>
            <td data-label="Customer Name"><%= rs.getString(6) %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            System.out.println("Problem " + e);
        }
        %>
    </tbody>
</table>

</body>
</html>

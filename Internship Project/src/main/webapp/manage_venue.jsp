<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
 <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="=" https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        
        <style>
         body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 1200px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .form-row {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
            flex: 1 1 45%; /* Each row takes about 45% of the width */
        }

        .form-row label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-row input[type="text"],
        .form-row input[type="number"],
        .form-row input[type="email"],
        .form-row input[type="file"],
        .form-row textarea {
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-row textarea {
            resize: vertical;
        }

        .form-row input[type="file"] {
            padding: 5px;
        }

        .form-row-full {
            flex: 1 1 100%; /* This will span the entire width */
        }

        .submit-row {
            text-align: center;
            width: 100%;
        }

        .submit-row input[type="submit"] {
            padding: 12px 30px;
            font-size: 16px;
            color: white;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        
                .delete-row {
            text-align: center;
            width: 100%;
        }

        .delete-row input[type="submit"] {
            padding: 12px 30px;
            font-size: 16px;
            color: white;
            background-color: #c1121f;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top:20px;
        }

        .delete-row input[type="submit"]:hover {
            background-color: #780000;
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
        <h1 style="text-align: center; font-size: 40px; padding: 2px; color: #df4881;text-decoration: underline; padding: 2px;">Manage venues</h1>
<div class="form-container">
    <form action="manage_venue_servlet" method="post" enctype="multipart/form-data" class="venue-form">

        <div class="form-row">
            <label for="venueName">Venue Name:</label>
            <input type="text" id="venueName" name="venueName" required>
        </div>

        <div class="form-row">
            <label for="venueContact">Venue Contact:</label>
            <input type="text" id="venueContact" name="venue_contact" required>
        </div>

        <div class="form-row">
            <label for="venuecost">Venue Cost:</label>
            <input type="text" id="venueEmail" name="venue_cost" required>
        </div>

        <div class="form-row">
            <label for="venuefoodcost">Venue Food Cost:</label>
            <input type="text" id="venueBookingCost" name="food_cost" required>
        </div>

        <div class="form-row">
            <label for="venueCapacity">Venue Capacity:</label>
            <input type="text" id="venueCapacity" name="capacity" required>
        </div>

        <div class="form-row form-row-full">
            <label for="venueAddress">Venue Address:</label>
            <input type="text" id="venueAddress" name="address" required>
        </div>

        <div class="form-row">
            <label for="venueService">Venue Service:</label>
            <input type="text" id="venueService" name="service" required>
        </div>

        <div class="form-row form-row-full">
            <label for="venueDescription">Venue Description:</label>
            <textarea id="venueDescription" name="description" rows="4" required></textarea>
        </div>

        <div class="form-row form-row-full">
            <label for="venuePhoto">Add Photo:</label>
            <input type="file" id="venuePhoto" name="photo" required>
        </div>

        <div class="submit-row">
            <input type="submit" value="Add Venue">
        </div>
 
    </form>      
                <form action="DeleteVenue.jsp" method="post">
                 <div class="delete-row">
            <input type="submit" value="Delete Venue" required>
            </form>
    
</div>
</body>
</html>
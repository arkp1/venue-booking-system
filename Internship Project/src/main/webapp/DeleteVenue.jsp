<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Venue</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light background */
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        /* Form styling */
        .form-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .form-container h1 {
            font-size: 1.5em;
            margin-bottom: 1em;
            color: #0056b3; /* Heading color */
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
        }

        /* Button styling */
        button {
            background-color: #dc3545; /* Red for delete */
            color: #fff;
            padding: 10px 15px;
            font-size: 1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Delete Venue</h1>
        <form action="DeleteVenueServlet" method="post">
            <label for="venueName">Enter Venue Name:</label>
            <input type="text" id="venueName" name="venueName" required>
            <button type="submit">Delete</button>
        </form>
    </div>
</body>
</html>

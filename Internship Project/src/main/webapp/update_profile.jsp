<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Information</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            overflow: auto; /* Allow scrolling if necessary */
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            max-height: 90vh; /* Set a maximum height for the container */
            overflow-y: auto; /* Enable vertical scrolling */
        }
        
             .container::-webkit-scrollbar {
            display: none; /* Hides the scrollbar */
        }
        
        h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .form-row {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-size: 14px;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus {
            border-color: #007BFF;
            outline: none;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 25px; /* Rounded button */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Required Fields</h2>
        <form action="update_profile_servlet" method="post" class="horizontal-form">

            <div class="form-row">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" >
            </div>

            <div class="form-row">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" >
            </div>

            <div class="form-row">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" >
            </div>
            
            <div class="form-row">
                <label for="phone">Mobile No.:</label>
                <input type="text" id="phone" name="phone" >
            </div>

            <div class="form-row">
                <label for="dob">Date of Birth:</label>
                <input type="text" id="dob" name="dob" placeholder="DD/MM/YYYY" >
            </div>

            <div class="form-row">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" >
            </div>

            <div class="form-row">
                <label for="city">City:</label>
                <input type="text" id="city" name="city">
            </div>

            <div class="form-row">
                <label for="state">State:</label>
                <input type="text" id="state" name="state">
            </div>

            <div class="form-row">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country">
            </div>

            <div class="form-row">
                <label for="password">Enter password for confirmation:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-row">
                <button type="submit">Update Details</button>
            </div>
        </form>
    </div>

</body>
</html>

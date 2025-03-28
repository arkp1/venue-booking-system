<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        label {
            font-size: 14px;
            color: #666;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
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

<form action="change_password">
    <h2>Change Password</h2>
    <label for="email">Enter your Email:</label>
    <input type="text" id="email" name="email" required><br>
    
    <label for="pwd">Enter new Password:</label>
    <input type="password" id="pwd" name="pwd" required><br>
    
    <label for="pwd1">Confirm new Password:</label>
    <input type="password" id="pwd1" name="pwd1" required><br>
    
    <button type="submit">Change Password</button>
</form>

</body>
</html>

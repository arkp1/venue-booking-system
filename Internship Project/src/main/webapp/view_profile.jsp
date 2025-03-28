<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }
        h2 {
            color: #007acc;
            margin-bottom: 20px;
        }
        input[type="text"] {
            width: calc(100% - 24px); /* Accounting for padding */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }
        button {
            background-color: #007acc;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #005b99;
        }
    </style>
</head>
<body>
    <form action="view_profile">
        <h2>Enter Username</h2>
        <input type="text" name="username" placeholder="Enter Username" required>
        <button type="submit">View</button>
    </form>
</body>
</html>



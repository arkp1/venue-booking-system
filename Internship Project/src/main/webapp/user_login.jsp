<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <style>
    
    @charset "UTF-8";
*{
    padding: 0%;
    margin: 0;
    box-sizing: border-box;
}

body{
    font-family: Arial, Helvetica, sans-serif;
    background-color: #f0f2f5;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.form-container{
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
}

h2{
    margin-bottom: 20px;
     color:#df4881;
}

.form-group{
    margin-bottom: 15px;
    text-align: left;
}

label{
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

input[type="text"],select{
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

#pass{
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"]{
    background-color: #df4881;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

input[type="submit"]:hover{
    background-color: #df4881;
}
    
    </style>
   
</head>
<body>
    <div class="form-container">
        <h2>User Login Form</h2>
        
        <form action="user_login_servlet" method="post" >
  <div class="form-group">
    <label for="name">User Name:</label>
    <input action="view_profile.jsp" type="text" id="name" name="username" placeholder="Enter your User name" required>
</div>

<div class="form-group">
    <label for="name">Password:</label>
    <input type="password" id="pass" name="password" placeholder="Enter password" required>
</div>

<div class="forgot-password">
  <a href="forgotPassword.jsp">Forgot Password?</a>
</div>

<div class="form-group">
    <input type="submit" value="Login">
</div>
        </form>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration Form</title>
    <style>
    
    * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 80%;
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    color:#df4881;
}

.horizontal-form {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.form-row {
    width: 48%;
    margin-bottom: 15px;
}

.form-row label {
    font-weight: bold;
    display: block;
    margin-bottom: 5px;
}

.form-row input[type="text"], 
.form-row input[type="password"], 
.form-row input[type="email"], 
.form-row input[type="file"] {
    padding: 10px;
    width: 100%;
    border: 1px solid #df4881;
    border-radius: 4px;
}

button {
    background-color:#df4881;
    color: white;
    padding: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

button:hover {
    background-color: #df4881;
}

/* Adjust for single row width for larger fields */
.form-row:last-child {
    width: 100%;
    text-align: center;
}

@media (max-width: 768px) {
    .form-row {
        width: 100%;
    }
}
    
    
    
    </style>
</head>
<body>

    <div class="container">
        <h2>User Registration</h2>
        <form action="users_register_servlet" method="post"  class="horizontal-form">

            <div class="form-row">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-row">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-row">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-row">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
                        <div class="form-row">
                <label for="password">Mobile No.:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-row">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" placeholder="DD/MM/YYYY" required>
            </div>

            <div class="form-row">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
            </div>

            <div class="form-row">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required>
            </div>

            <div class="form-row">
                <label for="state">State:</label>
                <input type="text" id="state" name="state" required>
            </div>

            <div class="form-row">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country" required>
            </div>

           

            <div class="form-row">
                <button type="submit">Register</button>
            </div>

        </form>
    </div>

</body>
</html>
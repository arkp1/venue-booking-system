<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete User</title>

  <style>
  
  * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f0f0f0;
  font-family: Arial, sans-serif;
}

.container {
  text-align: center;
}

h1 {
  margin-bottom: 20px;
  font-size: 2.5rem;
  color: #df4881;
}

.input-field {
  padding: 10px;
  width: 300px;
  font-size: 1rem;
  margin-bottom: 15px;
  border: 2px solid #ccc;
  border-radius: 5px;
}

.back-button {
  padding: 10px 20px;
  font-size: 1rem;
  background-color: #df4881;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.submit-button:hover {
  background-color: #df4881;
}

  
  </style>

</head>
<body>
<form action="delete_user_logic.jsp">
  <div class="container">
    <h1>Enter Username to delete:</h1>
    <input type="text" placeholder="Enter Username" class="input-field" name="delete">
    <button type="submit" class="back-button">Delete</button>
  </div>
</form>
</body>
</html>
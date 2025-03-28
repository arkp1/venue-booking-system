<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>

@charset "UTF-8";

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f0f0f0;
}

.container {
    display: flex;
    max-width: 1000px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    overflow: hidden;
}

.form-container {
    padding: 20px;
    width: 50%;
}

h2 {
    margin-bottom: 20px;
    color: #333;
}

form {
    display: flex;
    flex-direction: column;
}

label {
    margin-bottom: 5px;
    font-weight: bold;
}

input {
    margin-bottom: 15px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

button {
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color:  #0056b3;
}

.image-container {
    width: 50%;
}

.image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

 .left-side {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .left-side img {
            width: 100%;
            border-radius: 10px;
            max-width: 300px; /* Maximum width for the gif */
        }

        .right-side {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 20px;
        }

        .success-message {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #007bff; /* Success blue color */
        }

        .login-button {
            display: inline-block;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Bootstrap blue */
            border-radius: 5px;
            transition: background-color 0.3s ease;
            text-align: center;
            margin-top: 20px;
        }

        .login-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

 
        .left-side {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .left-side h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-button {
            padding: 12px 24px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Bootstrap blue */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .login-button:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }

        .right-side {
            flex: 1;
            background-color: #f9f9f9; /* Light gray background */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .right-side img {
            width: 100%;
            max-width: 300px; /* Max width for the cartoon image */
            border-radius: 10px;
        }

</style>
</head>
<body>

    <div class="container">
        <div class="form-container">
            <h2>Booking Update Form</h2>
            
            <form action="update_servlet.jsp" method="post">
            
             <label for="course">Booking ID:</label>
                <input type="text" id="course" name="id" placeholder="Enter Booking id" required>
            
                <label for="name">Customer name:</label>
                <input type="text" id="name" name="customer_name" placeholder="Enter Customer name" required>

             <label for="age">Venue name:</label>
                <input type="text" id="age" name="venue_name" placeholder="Enter Venue name" required>

                <label for="course">Event date:</label>
                <input type="date" id="course" name="event_date" placeholder="Enter Booking date" required>

              <label for="course">Event</label>
                <input type="text" id="course" name="event" placeholder="Enter Event" required>
                
                <label for="course">Attendees</label>
                 <input type="text" id="course" name="attendees" placeholder="Enter Attendees" required>
              
               <label for="course">Phone No.</label>
                <input type="text" id="course" name="phone" placeholder="Enter Phone Number" required>
                   
                    <label for="course">Email</label>
                <input type="text" id="course" name="email" placeholder="Enter your Email" required>
                          
                <button type="submit">Update</button>
               
            </form>
        </div>
        <div class="image-container">
            <img src="image/update_image3.jpg" alt="Registration Image">
        </div>
    </div>

</body>
</html>
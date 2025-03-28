<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Booking Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            transition: box-shadow 0.3s ease;
            display: flex;           /* Use flexbox for alignment */
            flex-direction: column;  /* Align items vertically */
        }

        form:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        input {
            width: 100%;             /* Full width for all input fields */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            transition: border-color 0.3s ease;
            box-sizing: border-box;  /* Include padding and border in width */
        }

        input:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;           /* Full width for the button */
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Placeholder styling */
        ::placeholder {
            color: #666;
            opacity: 1; /* Firefox */
        }

        /* Firefox */
        input:-moz-placeholder {
            color: #333;
        }

        /* Internet Explorer 10-11 */
        input:-ms-input-placeholder {
            color: #333;
        }
    </style>
</head>
<body>
    <form action="booking_form_servlet">
       <input type="text" name="venue" placeholder="Venue*" required>
        <input type="text" name="event" placeholder="Event Type*" required>
        <input type="date" name="eventdate" placeholder="Event Date*" required>
        <input type="number" name="people" placeholder="Number of People*" required min="1">
        <input type="text" name="fullname" placeholder="Full Name*" required>
        <input type="tel" name="phone" placeholder="Phone Number*" required pattern="[0-9]{10}">
        <input type="text" name="email" placeholder="Email*" required>
        <button type="submit">Book</button>
    </form>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="new_expense_reacker.ExpenseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="new_expense_reacker.ExpenseDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - Update Expense</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
             background-image: url('1p.jpg'); /* Set the path to your background image */
            background-position: center; /* Center the background image */
            background-attachment: fixed;
  			background-size: 100% 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
         nav {
            background-color: #333;
            overflow: hidden;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 999; /* Ensure it's above other content */
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
        }

        nav a:hover {
            background-color: #555;
        }
        .update-form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }
        
    </style>
    <script>
        // Check if the message parameter is present in the URL
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        if (message === 'success') {
            // If the message is 'success', display a pop-up message
            alert('Expense updated successfully!');
        }
    </script>
</head>
<body>
<nav>
        <div>
            <a href="#">Expense Tracker</a>
        </div>
        <div>
            <a href="userDetails.jsp">Home</a>
           
        </div>
    </nav>

    <div class="update-form">
        <h2>Update Expense</h2>
        <form action="UpdateServlet" method="post">
            ID: <input type="text" name="expenseId" required><br>
            Amount: <input type="text" name="amount" required><br>
            Description: <input type="text" name="description"><br>
            Date: <input type="date" name="date" required><br>
            Username: <input type="text" name="username" required id="usernameInput"><br>
            <input type="submit" value="Update">
           <a href="watchExpenses?username=" id="watchLink">Watch Your Data</a>
            
        </form>
      
    </div>
   <script>
    // Get the input field for username
    var usernameInput = document.getElementById('usernameInput');
    // Get the link for watching data
    var watchLink = document.getElementById('watchLink');

    // Add click event listener to the "Watch Your Data" link
    watchLink.addEventListener('click', function(event) {
        // Retrieve the logged-in username from the session
        var loggedInUsername = '<%= session.getAttribute("username") %>';

        // Retrieve the username entered by the user
        var enteredUsername = usernameInput.value.trim();

        // Check if the entered username matches the logged-in username
        if (enteredUsername !== loggedInUsername) {
            // If the usernames don't match, prevent the default action of the link
            event.preventDefault();
            // Show an error message
            alert("You are not authorized to view another user's expenses.");
        }
    });

    // Add event listener to input field
    usernameInput.addEventListener('input', function() {
        // Update the href attribute of the link with the entered username
        watchLink.href = "watchExpenses?username=" + encodeURIComponent(this.value);
    });
</script>
</body>
</html>

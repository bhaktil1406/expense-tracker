 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
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
        }

        .expense-form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: auto; /* Center the expense form horizontally */
            margin-top: 50px; /* Add space between navbar and form */
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
        
        nav {
            background-color: #333;
            overflow: hidden;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 5px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
        }

        nav a:hover {
            background-color: #555;
        }
    </style>
    <script>
        // Function to display an alert box with the given message
        function showAlert(message) {
            alert(message);
        }

        // Function to redirect to the specified URL
        function redirectTo(url) {
            window.location.href = url;
        }

        // Check if a success message exists and display it
        <% String successMessage = (String) request.getAttribute("successMessage"); %>
        <% if (successMessage != null && !successMessage.isEmpty()) { %>
            window.onload = function() {
                showAlert("<%= successMessage %>");
            };
        <% } %>
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
    <div class="expense-form">
        <h2><a href="index.jsp"> Add Expense</a></h2>
        <form action="ExpenseServlet" method="post">
           
            Date: <input type="date" name="date" id="searchDateInput"><br>
            Username: <input type="text" name="username" id="usernameInput" required><br>
            <input type="submit" value="watch Expense">
              <a href="#" id="watchLink">Watch Your Data</a>
          
        </form>
    </div>

    <script>
   
    // Get the input fields
    var usernameInput = document.getElementById('usernameInput');
    var searchDateInput = document.getElementById('searchDateInput');
    var watchLink = document.getElementById('watchLink');

    // Add event listener to input fields
    usernameInput.addEventListener('input', updateWatchLink);
    searchDateInput.addEventListener('input', updateWatchLink);

    // Function to update the URL for watching data
    function updateWatchLink() {
        var username = usernameInput.value.trim();
        var date = searchDateInput.value;

        // Check if both username and date are entered
        if (username !== '' && date !== '') {
            // Update the href attribute of the link with the entered username and date
            watchLink.href = "watchExpenses?username=" + encodeURIComponent(username) + "&date=" + encodeURIComponent(date);
        } else if (username === '' && date !== '') {
            // Show error if only date is entered
            alert("Please enter a username along with the date.");
            // Clear the value of date input
            searchDateInput.value = '';
        } else {
            // If only username is entered, update the href attribute with only the username
            watchLink.href = "watchExpenses?username=" + encodeURIComponent(username);
        }
    }

    // Add click event listener to the "Watch Your Data" link
    watchLink.addEventListener('click', function(event) {
        // Prevent the default action of the link
        event.preventDefault();

        // Retrieve the logged-in username from the session
        var loggedInUsername = '<%= session.getAttribute("username") %>';

        // Retrieve the username entered by the user
        var enteredUsername = usernameInput.value.trim();

        // Check if the entered username matches the logged-in username
        if (enteredUsername === loggedInUsername) {
            // If the usernames match, redirect to the watchExpenses page
            window.location.href = watchLink.href;
        } else {
            // If the usernames don't match, show an error message
            alert("You are not authorized to view another user's expenses.");
        }
    });

    </script>
</body>
</html>
 
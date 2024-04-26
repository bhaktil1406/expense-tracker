<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
</head>
<body>
    <h2>Add Expense</h2>
    <form action="ExpenseServlet" method="post">
    	ID: <input type="text" name="expenseId" required><br>
        Amount: <input type="text" name="amount" required><br>
        Description: <input type="text" name="description"><br>
        Date: <input type="date" name="date" required><br>
        Username: <input type="text" name="username"><br>
        <input type="submit" value="Add Expense">
        <a href="watchExpenses?username=" id="watchLink">Watch Your Data</a>
    </form>

    <script>
        // Get the input field for username
        var usernameInput = document.querySelector('input[name="username"]');
        // Get the link for watching data
        var watchLink = document.getElementById('watchLink');

        // Add event listener to input field
        usernameInput.addEventListener('input', function() {
            // Update the href attribute of the link with the entered username
            watchLink.href = "watchExpenses?username=" + encodeURIComponent(this.value);
        });
    </script>
</body>
</html>
 --%>
 
 
<%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .expense-form {
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
</head>
<body>
    <div class="expense-form">
        <h2>Add Expense</h2>
        <form action="ExpenseServlet" method="post">
            ID: <input type="text" name="expenseId" required><br>
            Amount: <input type="text" name="amount" required><br>
            Description: <input type="text" name="description"><br>
            Date: <input type="date" name="date" required><br>
            Username: <input type="text" name="username" id="usernameInput"><br>
            <input type="submit" value="Add Expense">
            <a href="watchExpenses?username=" id="watchLink">Watch Your Data</a>
        </form>
    </div>

    <script>
        // Get the input field for username
        var usernameInput = document.getElementById('usernameInput');
        // Get the link for watching data
        var watchLink = document.getElementById('watchLink');

        // Add event listener to input field
        usernameInput.addEventListener('input', function() {
            // Update the href attribute of the link with the entered username
            watchLink.href = "watchExpenses?username=" + encodeURIComponent(this.value);
        });
    </script>
</body>
</html>

 
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
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .expense-form {
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
</head>
<body>
    <div class="expense-form">
        <h2><a href="index.jsp"> Add Expense</a></h2>
        <form action="ExpenseServlet" method="post">
            ID: <input type="text" name="expenseId" required><br>
            Amount: <input type="text" name="amount" required><br>
            Description: <input type="text" name="description"><br>
            Date: <input type="date" name="date" required><br>
            Username: <input type="text" name="username" id="usernameInput"><br>
            <input type="submit" value="Add Expense">
            <a href="#" id="watchLink">Watch Your Data</a> <!-- Changed href to "#" -->
        </form>
    </div>

    <script>
        // Get the input field for username
        var usernameInput = document.getElementById('usernameInput');
        // Get the link for watching data
        var watchLink = document.getElementById('watchLink');

        // Add event listener to input field
        usernameInput.addEventListener('input', function() {
            // Update the href attribute of the link with the entered username
            watchLink.href = "watchExpenses?username=" + encodeURIComponent(this.value);
        });

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
 --%>
 
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
            ID: <input type="text" name="expenseId" required><br>
            Amount: <input type="text" name="amount" required><br>
            Description: <input type="text" name="description"><br>
            Date: <input type="date" name="date" id="searchDateInput"><br>
            Username: <input type="text" name="username" id="usernameInput" required><br>
            <input type="submit" value="Add Expense">
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
 
 
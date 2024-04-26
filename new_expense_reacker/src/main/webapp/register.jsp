<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
</head>
<body>
    <h2>User Registration</h2>
    <form action="RegisterServlet" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        /* Common styles for navigation bar */
        body {
            font-family: Arial, sans-serif;
             background-image: url('1p.jpg'); /* Set the path to your background image */
            background-position: center; /* Center the background image */
            background-attachment: fixed;
  			background-size: 100% 100%;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #333;
            overflow: hidden;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
        }

        nav a:hover {
            background-color: #555;
        }

        /* Styles for the registration form */
        .registration-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: 20px auto; /* Center the registration form */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
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
    </style>
</head>
<body>
    <nav>
        <div>
            <a href="#">Expense Tracker</a>
        </div>
        <div>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <div class="registration-container">
        <h2>User Registration</h2>
        <form action="RegisterServlet" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>

--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <style>
        /* Common styles for navigation bar */
        body {
            font-family: Arial, sans-serif;
            background-image: url('1p.jpg'); /* Set the path to your background image */
            background-position: center; /* Center the background image */
            background-attachment: fixed;
            background-size: 100% 100%;
            margin: 0;
            padding: 0;
        }

        nav {
            background-color: #333;
            overflow: hidden;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
        }

        nav a:hover {
            background-color: #555;
        }

        /* Styles for the registration form */
        .registration-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: 20px auto; /* Center the registration form */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="password"] {
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

        /* Error message style */
        .error-message {
            color: red;
            margin-top: 5px;
        }
    </style>
   <!--  <script>
        function validatePassword() {
            var password = document.getElementById("password").value;
            var passwordPattern = (?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,};
            if (!passwordPattern.test(password)) {
                document.getElementById("password-error").innerText = "Password must be at least 8 characters long and contain at least one letter and one digit.";
                return false;
            }
            return true;
        }
    </script> -->
    
     <script>
    // Function to display an alert box with the given message
    function showAlert(message) {
        alert(message);
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
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </nav>

    <div class="registration-container">
        <h2>User Registration</h2>
        <form action="RegisterServlet" method="post" >
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
            <span class="error-message" id="password-error"></span><br>
            <input type="submit" value="Register">
        </form>
    </div>
</body>
</html>
 
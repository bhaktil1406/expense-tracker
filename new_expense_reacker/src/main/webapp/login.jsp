<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
</head>
<body>
    <h2>User Login</h2>
    <form action="LoginServlet" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
 --%>
 
 <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
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

        /* Styles for login form */
        .login-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: 20px auto; /* Center the login form */
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
         <a href="index.jsp">Home</a>
            <a href="register.jsp">Register</a>
           <!--  <a href="#">Login</a>  -->
           
        </div>
    </nav>

    <div class="login-container">
        <h2>User Login</h2>
        <form action="LoginServlet" method="post">
            Username: <input type="text" name="username" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
            <center><a href="register.jsp" style="color:green; text-decoration: none;">new user</a> </center>
        </form>
    </div>
</body>
</html>

 
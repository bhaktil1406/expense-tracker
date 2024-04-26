<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Tracker</title>
<style>
    /* Common styles for navigation bar */
    body {
        font-family: Arial, sans-serif;
        background-image: url('1p.jpg'); /* Set the path to your background image */
        background-position: center; /* Center the background image */
        background-attachment: fixed;
        background-size: cover;
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

    /* Styles for the heading */
    h1 {
        text-align: center;
        margin-top: 50px;
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        font-size: 36px;
        color: #333;
    }
    
    .box-container {
        display: flex;
        justify-content: space-around;
        margin-top: 50px;
    }

    .box {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 20px;
        border-radius: 8px;
        width: 30%;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    .box h2 {
        margin-bottom: 20px;
    }

    .box p {
        margin-bottom: 20px;
    }

    .box img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        margin-bottom: 10px;
    }
</style>
<script>

// logout function delete session 

function logout() {
    // Check if the user is logged in (example: assuming session is managed by Servlet API)
    <% if (session.getAttribute("username") != null) { %>
        // Clear session data
        <% session.invalidate(); %>
        // Redirect to logout page
        window.location.href = "login.jsp"; 
        // Change "logout.jsp" to the actual logout page URL
        alert("log out successfully");
    <% } else { %>
        // Display message to prompt the user to first login
        alert("Please login first.");
    <% } %>
}
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

    <h1>Expense Tracker</h1>
    
    <div class="box-container">
        <div class="box">
            <img src="2p.png" alt="Add Expense">
            <h2>Add Expense</h2>
            <p>Add your expense details here. Enter the amount, description, and date of the expense to keep track of your spending.</p>
        </div>
        <div class="box">
            <img src="3p.png" alt="Watch Expenses" >
            <h2>Watch Expenses</h2>
            <p>View your expense details here. You can filter expenses by date or category to analyze your spending habits.</p>
        </div>
        <div class="box">
            <img src="4p.jpg" alt="User Details">
            <h2>User Details</h2>
            <p>Check your user details here. This includes information such as your username, total expenses, and account settings.</p>
        </div>
    </div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Details</title>
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

        /* Style for the user details box */
        .user-details-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            margin: 20px auto; /* Center the user details box */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 10px;
        }
    </style>
    
    <script>
  function logout() {
    // Send an AJAX request to the server (optional)
    // This is useful if you want to perform any server-side tasks on logout (e.g., logging)
    
    // Invalidate the session on the client-side
    window.sessionStorage.clear(); // For session storage
    // OR (if you're using cookies for session management)
    // document.cookie = "session_id=; expires=Thu, 01 Jan 1970 00:00:00 GMT; path=/";
  }
</script>
   
</head>
<body>
    <nav>
        <div class="left">
            <a href="#">Expense Tracker</a>
        </div>
        <div class="right">
            
            <a href="expense.jsp">Add Expense</a>
             <a href="my_expenses.jsp">watch Expense</a>
            <a href="index.jsp" onclick="logout()">Logout</a>
        </div>
    </nav>
    
    <div class="user-details-box">
        <h2>User Details</h2>
        <% 
            HttpSession session2 = request.getSession();
            String username = (String) session.getAttribute("username");
            
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/expense_tracker";
            String dbUsername = "root";
            String dbPassword = "";

            try (Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // Fetch user details from the database based on the username
                try (PreparedStatement stmt = connection.prepareStatement("SELECT SUM(amount) AS totalExpense FROM expenses WHERE username = ?")) {
                    stmt.setString(1, username);
                    ResultSet rs = stmt.executeQuery();
                    
                    // Check if there is a result
                    if (rs.next()) {
                        double totalExpense = rs.getDouble("totalExpense"); // Retrieve the total expense
                        
                        // Output user details within the HTML
        %>
                        <p>Username: <%= username %></p>
                        <p>Total Expense: <%= totalExpense %></p>
        <%
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </div>
    
   <%--  <script>

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
</script> --%>
</body>
</html>

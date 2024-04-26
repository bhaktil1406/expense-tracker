<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="new_expense_reacker.ExpenseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="new_expense_reacker.ExpenseDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - My Expenses</title>
</head>
<body>
    <h2>My Expenses</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Amount</th>
                <th>Description</th>
                <th>Date</th>
                <th>Action</th> <!-- Added Action column -->
            </tr>
        </thead>
        <tbody>
            <% 
                // Import the ExpenseDAO class and retrieve expenses based on the username
                String username = request.getParameter("username");
                List<ExpenseDAO.Expense> expenses = new ExpenseDAO().getExpensesByUsername(username);

                // Iterate through the expenses and display them in the table
                for (ExpenseDAO.Expense expense : expenses) {
            %>
            <tr>
                <td><%= expense.getAmount() %></td>
                <td><%= expense.getDescription() %></td>
                <td><%= expense.getDate() %></td>
                <td>
                    <form action="UpdateExpenseServlet" method="post"> <!-- Form for Update -->
                        <input type="hidden" name="expenseId" value="">
                        <input type="submit" value="Update">
                    </form>
                    <form action="DeleteExpenseServlet" method="post"> <!-- Form for Delete -->
                        <input type="hidden" name="expenseId" value="<%= expense.getId() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
 --%>
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="new_expense_reacker.ExpenseDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="new_expense_reacker.ExpenseDAO" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Tracker - My Expenses</title>
    <style>
        body {
            font-family: Arial, sans-serif;
             background-image: url('1p.jpg'); /* Set the path to your background image */
            background-position: center; /* Center the background image */
            background-attachment: fixed;
  			background-size: 100% 100%;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        td input[type="submit"] {
            padding: 5px 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        td input[type="submit"]:hover {
            background-color: #45a049;
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
    <h2>My Expenses</h2>
    <table>
        <thead>
            <tr>
            	<th>Expense Id</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Date</th>
                <th>Action</th> <!-- Added Action column -->
            </tr>
        </thead>
        <tbody>
            <% 
                // Import the ExpenseDAO class and retrieve expenses based on the username
                String username = request.getParameter("username");
               // List<ExpenseDAO.Expense> expenses = new ExpenseDAO().getExpensesByUsername(username);
               
                 String date = request.getParameter("date");

                // Import the ExpenseDAO class and retrieve expenses based on the username and date
                List<ExpenseDAO.Expense> expenses;
                if (date != null && !date.isEmpty()) {
                    expenses = new ExpenseDAO().getExpensesByUsernameAndDate(username, date);
                } else {
                    expenses = new ExpenseDAO().getExpensesByUsername(username);
                }


                // Iterate through the expenses and display them in the table
                for (ExpenseDAO.Expense expense : expenses) {
            %>
            <tr>
               <td><%= expense.getId() %></td>
                <td><%= expense.getAmount() %></td>
                <td><%= expense.getDescription() %></td>
                <td><%= expense.getDate() %></td>
                <td>
                    <form action="Update.jsp" method="post"> <!-- Form for Update -->
                        <input type="hidden" name="expenseId" value="<%= expense.getId() %>">
                        <input type="submit" value="Update">
                    </form>
                    <form action="DeleteExpenseServlet" method="post"> <!-- Form for Delete -->
                        <input type="hidden" name="expenseId" value="<%= expense.getId() %>">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
 
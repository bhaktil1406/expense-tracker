//package new_expense_reacker;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/UpdateServlet")
//public class UpdateServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Retrieve parameters from the request
//        int id = Integer.parseInt(request.getParameter("expenseId"));
//        double amount = Double.parseDouble(request.getParameter("amount"));
//        String description = request.getParameter("description");
//        String date = request.getParameter("date");
//        String username = request.getParameter("username");
//
//        // Create Expense object
//        ExpenseDAO.Expense expense = new ExpenseDAO.Expense(id, amount, description, date, username);
//        
//        // Update expense in the database
//        ExpenseDAO expenseDAO = new ExpenseDAO();
//        boolean updated = expenseDAO.updateExpense(expense);
//
//        if (updated) {
//            // If the update was successful, redirect the user to a success page or perform other actions
//        	response.sendRedirect("Update.jsp?message=success");
//        } else {
//            // If the update failed, redirect the user to an error page or perform other actions
//        	 response.getWriter().println("Failed to updat expense.");
//        }
//    }
//}


package new_expense_reacker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        int id = Integer.parseInt(request.getParameter("expenseId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String username = request.getParameter("username");

        // Retrieve the username of the logged-in user from the session
        HttpSession session = request.getSession(false);
        String loggedInUsername = (String) session.getAttribute("username");

        // Check if the logged-in user matches the user trying to update the expense
        if (username.equals(loggedInUsername)) {
            // Create Expense object
            ExpenseDAO.Expense expense = new ExpenseDAO.Expense(id, amount, description, date, username);
            
            // Update expense in the database
            ExpenseDAO expenseDAO = new ExpenseDAO();
            boolean updated = expenseDAO.updateExpense(expense);

            if (updated) {
                // If the update was successful, redirect the user to a success page with a message
                response.sendRedirect("Update.jsp?message=success");
            } else {
                // If the update failed, redirect the user to an error page or perform other actions
            	response.getWriter().println("Failed to updat expense.");
            }
        } else {
            // User is not authorized to update expenses for another user
        	 response.getWriter().println("You are not authorized to add expense for another user.");
        }
    }
}

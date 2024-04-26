//package new_expense_reacker;
//
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/DeleteExpenseServlet")
//public class DeleteExpenseServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Get the expense ID from the request parameter
//        int expenseId = Integer.parseInt(request.getParameter("expenseId"));
//
//        // Delete the expense from the database using ExpenseDAO
//        ExpenseDAO expenseDAO = new ExpenseDAO();
//        boolean deleted = expenseDAO.deleteExpense(expenseId);
//
//        if (deleted) {
//           // If the deletion was successful, redirect the user to the page showing updated expenses
//          String username = request.getParameter("username");
//          System.out.println(username);
//          response.sendRedirect("watchExpenses?username=" + username);
//        	
//        } else {
//            // If the deletion failed, show an error message
//            response.getWriter().println("Failed to delete the expense.");
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

@WebServlet("/DeleteExpenseServlet")
public class DeleteExpenseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the expense ID from the request parameter
        int expenseId = Integer.parseInt(request.getParameter("expenseId"));

        // Delete the expense from the database using ExpenseDAO
        ExpenseDAO expenseDAO = new ExpenseDAO();
        boolean deleted = expenseDAO.deleteExpense(expenseId);

        if (deleted) {
            // If the deletion was successful, set a success message as a request attribute
            request.setAttribute("successMessage", "Record deleted successfully!");
        } else {
            // If the deletion failed, set an error message as a request attribute
            request.setAttribute("errorMessage", "Failed to delete the expense.");
        }

        // Forward the request to my_expenses.jsp
        request.getRequestDispatcher("my_expenses.jsp").forward(request, response);
    }
}

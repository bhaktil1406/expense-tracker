//package new_expense_reacker;
//
//import java.io.IOException;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import new_expense_reacker.ExpenseDAO.Expense;
//
//@WebServlet("/watchExpenses")
//public class ExpenseWatchServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        ExpenseDAO expenseDAO = new ExpenseDAO();
//        List<Expense> expenses = expenseDAO.getExpensesByUsername(username);
//        request.setAttribute("expenses", expenses);
//        request.getRequestDispatcher("watch_expenses.jsp").forward(request, response);
//    }
//}


package new_expense_reacker;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import new_expense_reacker.ExpenseDAO.Expense;

@WebServlet("/watchExpenses")
public class ExpenseWatchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String date = request.getParameter("date");

        ExpenseDAO expenseDAO = new ExpenseDAO();
        List<Expense> expenses;

        if (username != null && !username.isEmpty()) {
            if (date != null && !date.isEmpty()) {
                // Fetch expenses for a specific username and date
                expenses = expenseDAO.getExpensesByUsernameAndDate(username, date);
            } else {
                // Fetch all expenses for a specific username
                expenses = expenseDAO.getExpensesByUsername(username);
            }
        } else {
            // Handle case where username is not provided
            // For example, you can redirect the user to an error page or display a message
            response.sendRedirect("error.jsp"); // Adjust this accordingly
            return;
        }

        request.setAttribute("expenses", expenses);
        request.getRequestDispatcher("watch_expenses.jsp").forward(request, response);
    }
}

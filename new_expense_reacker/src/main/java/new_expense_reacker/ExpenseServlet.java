package new_expense_reacker;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/ExpenseServlet")
//public class ExpenseServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	int id=Integer.parseInt(request.getParameter("expenseId"));
//        double amount = Double.parseDouble(request.getParameter("amount"));
//        String description = request.getParameter("description");
//        String date = request.getParameter("date");
//        String username = request.getParameter("username");
//
//        ExpenseDAO.Expense expense = new ExpenseDAO.Expense(id, amount, description, date, username);
//        ExpenseDAO expenseDAO = new ExpenseDAO();
//        boolean isExpenseAdded = expenseDAO.addExpense(expense);
//
//        if (isExpenseAdded) {
//            response.sendRedirect("expense.jsp");
//        } else {
//            response.getWriter().println("Failed to add expense.");
//        }
//    }
//}
//
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ExpenseServlet")
public class ExpenseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String loggedInUsername = (String) session.getAttribute("username");

        int id = Integer.parseInt(request.getParameter("expenseId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String usernameFromForm = request.getParameter("username");

        if (usernameFromForm.equals(loggedInUsername)) {
            // Username from form matches the logged-in user's username
            ExpenseDAO.Expense expense = new ExpenseDAO.Expense(id, amount, description, date, usernameFromForm);
            ExpenseDAO expenseDAO = new ExpenseDAO();
            boolean isExpenseAdded = expenseDAO.addExpense(expense);

            if (isExpenseAdded) {	
                response.sendRedirect("expense.jsp");
            } else {
                response.getWriter().println("Failed to add expense.");
            }
        } else {
            // User is trying to add expense with a different username
            response.getWriter().println("You are not authorized to add expense for another user.");
        }
    }
}

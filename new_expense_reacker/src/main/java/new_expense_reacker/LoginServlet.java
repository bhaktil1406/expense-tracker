//package new_expense_reacker;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//
//        UserDAO userDAO = new UserDAO();
//        boolean isValidUser = userDAO.validateUser(username, password);
//
//        if (isValidUser) {
//            response.sendRedirect("expense.jsp");
//        } else {
//            response.getWriter().println("Invalid username or password.");
//        }
//    }
//}
//

package new_expense_reacker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        boolean isValidUser = userDAO.validateUser(username, password);

        if (isValidUser) {
            // Store username in session
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Redirect to the expense page
            response.sendRedirect("userDetails.jsp");
        } else {
            // If authentication fails, show error message
            response.getWriter().println("Invalid username or password.");
        }
    }
}

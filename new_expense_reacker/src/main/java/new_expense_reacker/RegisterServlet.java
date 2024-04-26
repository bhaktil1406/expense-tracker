package new_expense_reacker;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO.User user = new UserDAO.User(username, password);
        UserDAO userDAO = new UserDAO();
        boolean isRegistered = userDAO.addUser(user);
        if (isRegistered){
            // Set success message as a request attribute
            request.setAttribute("successMessage", "Registration successful! You can now login.");
        } else {
            // Set error message as a request attribute
            request.setAttribute("errorMessage", "Registration failed. Please try again.");
        }

        // Forward the request to login.jsp
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
}

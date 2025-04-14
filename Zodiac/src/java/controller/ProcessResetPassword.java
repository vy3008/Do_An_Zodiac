package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProcessResetPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("username");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        String message;

        if (!newPassword.equals(confirmPassword)) {
            message = "Passwords do not match!";
        } else {
            UserDAO userDAO = new UserDAO();
            boolean updated = userDAO.updatePassword(username, newPassword);

            if (updated) {
                message = "success";
                request.setAttribute("message", message);
                request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
                return;
            } else {
                message = "Failed to reset password. Please try again.";
            }
        }

        request.setAttribute("message", message);
        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

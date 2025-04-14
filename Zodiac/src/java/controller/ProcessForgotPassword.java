package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ProcessForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RequestDispatcher dis = request.getRequestDispatcher("forgotPassword.jsp");
        dis.forward(request, response); 
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String message;

        if (username == null || username.trim().isEmpty()) {
            message = "Username cannot be empty!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("forgot.jsp").forward(request, response);
            return;  // Dừng lại để không tiếp tục thực thi các dòng sau
        }

        UserDAO userDAO = new UserDAO();
        boolean exists = userDAO.isExistUsername(username);

        if (exists) {
            request.getSession().setAttribute("username", username);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } else {
            message = "Username not found! Please check again.";
            request.setAttribute("message", message);
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

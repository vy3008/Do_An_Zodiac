package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import model.User;

public class ProcessLogin extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 🔍 Kiểm tra cookie để tự động đăng nhập nếu có
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("password")) {
                    password = cookie.getValue();
                }
            }
        }

        if (username != null && password != null) {
            User user = UserDAO.handleLogin(username, password);
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("./home");
                return;
            }
        }

        // Nếu chưa có cookie hoặc login thất bại, chuyển về login.jsp
        RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
        dis.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = UserDAO.handleLogin(username, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // ✅ Lưu thông tin vào cookie (tồn tại 7 ngày)
            Cookie userCookie = new Cookie("username", username);
            Cookie passCookie = new Cookie("password", password);
            userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
            passCookie.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(userCookie);
            response.addCookie(passCookie);

            response.sendRedirect("./home");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("message", "Login Failed");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

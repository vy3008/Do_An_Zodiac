package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class ProcessLogout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // ✅ Xóa cookie
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("username".equals(cookie.getName()) || "password".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    response.addCookie(cookie);
                }
            }
        }

        response.sendRedirect("home.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // dùng lại logic từ doGet
    }

    @Override
    public String getServletInfo() {
        return "Logout Servlet";
    }
}

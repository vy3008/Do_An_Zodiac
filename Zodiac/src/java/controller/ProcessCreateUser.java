package controller;

import dao.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class ProcessCreateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("cfmpassword");

        // Kiểm tra tài khoản đã tồn tại trước
        if (UserDAO.isExistUsername(username)) {
            request.setAttribute("message", "Tài khoản đã tồn tại!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            return; // Dừng luôn, không cần kiểm tra tiếp
        }

        // Kiểm tra mật khẩu có trùng khớp không
        if (!password.equals(confirmPassword)) {
            request.setAttribute("message", "Mật khẩu không trùng khớp!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
            return;
        }

        // Nếu mọi thứ OK, mới tạo User và lưu vào DB
        User user = new User(username, password, confirmPassword);
        boolean isCreated = UserDAO.insertUser(user);

        if (!isCreated) {
            request.setAttribute("message", "Lỗi máy chủ, vui lòng thử lại!");
            RequestDispatcher dis = request.getRequestDispatcher("register.jsp");
            dis.forward(request, response);
        } else {
            response.sendRedirect("./login"); // Đăng ký thành công, chuyển sang trang login
        }
    }

    @Override
    public String getServletInfo() {
        return "Xử lý đăng ký tài khoản";
    }
}

package controller;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*") 
public class AuthFilter implements Filter {
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        // Các trang cho phép truy cập mà không cần đăng ký
        String path = req.getRequestURI();
        boolean isRegisterPage = path.endsWith("register.jsp") || path.endsWith("/register");
        boolean isLoginPage = path.endsWith("login.jsp") || path.endsWith("/login");
        boolean isCreateUser = path.endsWith("/create-user"); // Cho phép xử lý đăng ký

        // Nếu người dùng chưa đăng ký (chưa có session) và không vào trang đăng ký, chuyển hướng về đăng ký
        if (session == null || session.getAttribute("user") == null) {
            if (!isRegisterPage && !isLoginPage && !isCreateUser) {
                res.sendRedirect("register.jsp");
                return;
            }
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
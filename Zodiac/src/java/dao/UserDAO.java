package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;

public class UserDAO {
    //Kết nối database
    public static Connection openConnection() {
        Connection conn = null;
        try {
            System.out.println("Hello from DBConfig.driver " + DBConfig.driver);
            Class.forName(DBConfig.driver);
            conn = DriverManager.getConnection(DBConfig.url, DBConfig.user, DBConfig.password);
            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return conn;
    }
    //Xử lý login 
    public static User handleLogin(String username, String password) {
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (Connection c = openConnection(); PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getString("username"),
                            rs.getString("password")
                    );
                }
            }
        } catch (Exception ex) {
            System.err.println("Error during login: " + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
<<<<<<< HEAD
    
=======
    //Kiểm tra người dùng đã có tồn tải chưa
>>>>>>> 3fa1bd8bde2123fde85a0379a2f1384a42aec52c
    public static boolean isExistUsername(String username) {
        String query = "SELECT 1 FROM users WHERE username = ?";
        try (Connection c = openConnection(); PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return true;  
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false; 
    }
    //Thêm người dùng vào database
    public static boolean insertUser(User user) {
        String query = "INSERT INTO USERS(username, password) VALUES (?, ?)";
        try (Connection c = openConnection(); PreparedStatement ps = c.prepareStatement(query)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            int row = ps.executeUpdate();
            return row > 0; 
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
}

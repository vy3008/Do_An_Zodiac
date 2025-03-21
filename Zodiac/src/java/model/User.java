
package model;

public class User {
    private String username, password, cfmpassword;

    public User() {
    }

    public User(String username, String password, String cfmpassword) {
        this.username = username;
        this.password = password;
        this.cfmpassword = cfmpassword;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getCfmpassword() {
        return cfmpassword;
    }
}

package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    public Connection getConnection() throws SQLException, ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/furama_manager";
        String username = "root";
        String password = "12345";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL,username,password);
    }

    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection());
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
    }
}

package dao;

import context.DBContext;
import entity.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Customer> getAllCustomer() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM khach_hang";
        try {
            connection = new DBContext().getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(  rs.getInt(1),
                                        rs.getString(3),
                                        rs.getString(4),
                                        rs.getString(6),
                                        rs.getString(5),
                                        rs.getString(7),
                                        rs.getString(8),
                                        rs.getString(2),
                                        rs.getString(9)));
            }
        } catch (SQLException | ClassNotFoundException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Customer> list = dao.getAllCustomer();
        for (Customer c: list
             ) {
            System.out.println(c);
            
        }
    }
}

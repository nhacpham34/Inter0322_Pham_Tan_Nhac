package repository;

import model.Customer;
import model.Employee;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository {
//    Khai báo baseRepo để kết nối csdl
    BaseRepository baseRepository = new BaseRepository();
    private static List<Employee> employeeList = new ArrayList<>();
    /*static {
        employeeList.add(new Employee(1,"Nhac","20/12/2000","123456",
                "654321","abcd@gmail.com",1,2,100000.9));
        employeeList.add(new Employee(2,"Nhac","20/12/2000","123456",
                "654321","abcd@gmail.com",1,2,100000.9));
        employeeList.add(new Employee(3,"Nhac","20/12/2000","123456",
                "654321","abcd@gmail.com",1,2,100000.9));
        employeeList.add(new Employee(4,"Nhac","20/12/2000","123456",
                "654321","abcd@gmail.com",1,2,100000.9));
    }*/

    public List<Employee> getEmployeeList() {
        List<Employee> employeeList = new ArrayList<>();
        String querySelect = "SELECT * FROM nhan_vien";
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement(querySelect);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                employeeList.add(new Employee(rs.getInt("ma_nhan_vien"),
                        rs.getString("ho_ten"),
                        rs.getString("ngay_sinh"),
                        rs.getString("so_cmnd"),
                        rs.getString("so_dien_thoai"),
                        rs.getString("email"),
                        rs.getInt("ma_trinh_do"),
                        rs.getInt("ma_vi_tri"),
                        rs.getLong("luong")));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeList;
    }

    public Employee getEmployeeId( int id) {
        Employee employee = new Employee();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT * FROM nhan_vien WHERE ma_nhan_vien = ?");
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                employee = (new Employee(rs.getInt("ma_nhan_vien"),
                        rs.getString("ho_ten"),
                        rs.getString("ngay_sinh"),
                        rs.getString("so_cmnd"),
                        rs.getString("so_dien_thoai"),
                        rs.getString("email"),
                        rs.getInt("ma_trinh_do"),
                        rs.getInt("ma_vi_tri"),
                        rs.getLong("luong")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  employee;
    }

    public int getIdMax() {
        int id = 0;
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection().prepareStatement("SELECT Max(ma_nhan_vien) FROM nhan_vien");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public void addNewEmployee(Employee employee) {
        try {
            String queryInsert = "INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)" +
                    "VALUES (?,?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection()
                    .prepareStatement(queryInsert);
            preparedStatement.setInt(1,employee.getId());
            preparedStatement.setString(2,employee.getName());
            preparedStatement.setDate(3, Date.valueOf(employee.getDateOfBirth()));
            preparedStatement.setString(4,employee.getIdCard());
            preparedStatement.setString(6,employee.getSdt());
            preparedStatement.setString(7,employee.getEmail());
            preparedStatement.setInt(9,employee.getPositionId());
            preparedStatement.setInt(10, employee.getEducationId());
            preparedStatement.setDouble(5,employee.getPrice());
            preparedStatement.setString(8,"Chổ này chưa tạo nha");
            preparedStatement.setInt(11,1);
            preparedStatement.executeUpdate();
            System.out.println("vào tới đây là thêm thành công rồi");
        } catch (SQLException e) {
            System.out.println("co log nay thi xem lai create");
            e.printStackTrace();
        }
    }

    public void updateEmployeeId(Employee employee) {
        try {
            String queryUpdate ="UPDATE nhan_vien SET ho_ten =?, ngay_sinh = ? , so_cmnd = ?, luong = ?,so_dien_thoai = ?, email = ?," +
                    "ma_vi_tri = ? ,ma_trinh_do = ?  WHERE ma_nhan_vien = ? " ;
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement(queryUpdate);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setDate(2, Date.valueOf(employee.getDateOfBirth()));
            preparedStatement.setString(3,employee.getIdCard());
            preparedStatement.setDouble(4, employee.getPrice());
            preparedStatement.setString(5,employee.getSdt());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setInt(7,employee.getPositionId());
            preparedStatement.setInt(8, employee.getEducationId());
            preparedStatement.setInt(9, employee.getId());
            int row = preparedStatement.executeUpdate();
            System.out.println("thành công rồi nè mấy cậu" + row);

        } catch (SQLException e) {
            System.out.println("lỗi rồi a ơiii");
            e.printStackTrace();

        }
    }

    public void deleteEmployee(int id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository
                    .getConnection().prepareStatement("Delete FROM nhan_vien where ma_nhan_vien = ? ");
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            System.out.println(row);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

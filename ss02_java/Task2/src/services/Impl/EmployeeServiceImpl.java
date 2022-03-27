package services.Impl;

import models.Employee;
import services.EmployeeService;
import utils.ReadAndWrite;
import utils.RegexData;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class EmployeeServiceImpl implements EmployeeService {
    public   static final String BIRTHDAY_REGEX = "(^(((0[1-9]|1[0-9]|2[0-8])[\\/](0[1-9]|1[012]))|((29|30|31)[\\/](0[13578]|1[02]))|((29|30)[\\/](0[4,6,9]|11)))[\\/](19|[2-9][0-9])\\d\\d$)|(^29[\\/]02[\\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)";
    public  static final String SDT_REGEX = "^(0\\d{8,})$";
    public  static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z.-]+\\.[A-Za-z]{2,6}$";
    public  static final String ID_CARD_REGEX = "^(\\d{9,12})$";
    public  static final String REGEX_STR = "[A-Z][A-Za-z\\s]+$";
    public static final String REGEX_INT = "^([1-9]\\d{0,})$";
    public static final String REGEX_SEX = "^((Male)||(Female))$";






    // Khởi tạo 1 array list có kiểu dữ liệu là Employee
    private static List<Employee>  employeeList = new ArrayList<>();

    private static Scanner scanner = new Scanner(System.in);

    @Override
    public void display() {
        try{
            employeeList = (List<Employee>) ReadAndWrite.read("D:\\HocCodeGym\\Hoc_JAVA\\Task2\\src\\data\\employee.csv");
            for (Employee employee: employeeList) {
                System.out.println(employee.toString());
            }
        }catch (Exception e) {
            System.out.println("File không đọc được");
            for (Employee employee: employeeList) {
                System.out.println(employee.toString());
            }
        }

    }

    private String inputID(){
        System.out.println("Nhập Id nhân viên: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, Id nhân viên phải là 1 chuỗi số");
    }
    private String inputName(){
        System.out.println("Nhập tên: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, Tên phải viết hoa chữ cái đầu");
    }
    private String inputLevel(){
        System.out.println("Nhập Level hiện tại: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, Level phải viết hoa chữ cái đầu");
    }
    private String inputPosition(){
        System.out.println("Nhập chức vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, Chức vụ phải viết hoa chữ cái đầu");
    }

    private String inputSex(){
        System.out.println("Nhập giới tính: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_SEX,
                "Giói tính của bạn không đúng. Vui lòng nhập lại!");
    }

    private String inputStd(){
        System.out.println("Nhập số điện thoại: ");
        return RegexData.regexStr(scanner.nextLine(),SDT_REGEX,
                "Bạn đã nhập sai định dạng, SDT phải bắt đầu bằng số 0 và dài ít nhất 9 kí tự số");
    }

    private String inputEmail(){
        System.out.println("Nhập dịa chỉ email: ");
        return RegexData.regexStr(scanner.nextLine(),EMAIL_REGEX,
                "Bạn đã nhập sai định dạng email");
    }

    private String inputCardId(){
        System.out.println("Nhập số CMND hoặc CCCD: ");
        return RegexData.regexStr(scanner.nextLine(),ID_CARD_REGEX,
                "Bạn đã nhập sai định dạng! Vui lòng nhập lại.");
    }
    private String inputWage(){
        System.out.println("Nhập lương: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, Lương phải là số dương");
    }

    @Override
    public void addNew() {
            int id = Integer.parseInt(inputID());
            String name = inputName();
            String cardId = inputCardId();
            System.out.println("Nhập ngày sinh: ");
            String dateOfBirth = RegexData.regexAge(scanner.nextLine(), BIRTHDAY_REGEX );
            String sex = inputSex();
            String sdt = inputStd();
            String email = inputEmail();
            String level = inputLevel();
            String position = inputPosition();
            double wage = Double.parseDouble(inputWage());
            Employee employee = new Employee(id, name, dateOfBirth,
                    cardId, sex, sdt, email, level, position, wage);
            employeeList.add(employee);
            System.out.println("Thêm thành công nhân viên có mã Id là: " + id);
            try {
                ReadAndWrite.write(employeeList, "D:\\HocCodeGym\\Hoc_JAVA\\Task2\\src\\data\\employee.csv");

            }catch (Exception e) {
                System.out.println("không thể ghi file");
            }

    }

    @Override
    public void edit() {
        try {
            System.out.printf("Nhập EmployeeId cần update: ");
            int id = Integer.parseInt(scanner.nextLine());
            for(int i= 0 ; i < employeeList.size(); i++) {
                if(employeeList.get(i).getId() == id) {
                    String name = inputName();
                    String cardId = inputCardId();
                    System.out.println("Nhập ngày sinh: ");
                    String dateOfBirth = RegexData.regexAge(scanner.nextLine(), BIRTHDAY_REGEX );
                    String sex = inputSex();
                    String sdt = inputStd();
                    String email = inputEmail();
                    String level = inputLevel();
                    String position = inputPosition();
                    double wage = Double.parseDouble(inputWage());
                    Employee employee1 = new Employee(id, name, dateOfBirth,
                            cardId, sex, sdt, email, level, position, wage);
                    employeeList.remove(i);
                    employeeList.add(employee1);
                    System.out.println("Update thành công nhân viên có mã Id là: " + id);
                    return;
                }
            }
            System.out.println("Nhân viên không tồn tại!!!");
        } catch (NumberFormatException e) {
            System.out.println("Bạn đã nhập sai vui lòng nhập lại");
        }

    }

    @Override
    public void delete() {
        try {
            System.out.printf("Nhập EmployeeId cần update:");
            int id = Integer.parseInt(scanner.nextLine());
            for(int i= 0 ; i < employeeList.size(); i++) {
                if(employeeList.get(i).getId() == id) {
                    employeeList.remove(i);
                    System.out.println("Xóa thành công!!!" );
                    return;
                }
            }
            System.out.println("Không tồn tại nhân viên có mã: " + id );
        } catch (NumberFormatException e) {
            System.out.println("Bạn đã nhập sai vui lòng nhập lại");
        }

    }
}

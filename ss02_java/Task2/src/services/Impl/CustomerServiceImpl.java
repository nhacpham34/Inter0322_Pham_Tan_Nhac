package services.Impl;

import models.Customer;
import models.Employee;
import services.CustomerService;
import utils.RegexData;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;

public class CustomerServiceImpl implements CustomerService {
    public   static final String BIRTHDAY_REGEX = "(^(((0[1-9]|1[0-9]|2[0-8])[\\/](0[1-9]|1[012]))|((29|30|31)[\\/](0[13578]|1[02]))|((29|30)[\\/](0[4,6,9]|11)))[\\/](19|[2-9][0-9])\\d\\d$)|(^29[\\/]02[\\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)";
    public  static final String SDT_REGEX = "^(0\\d{8,})$";
    public  static final String EMAIL_REGEX = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$";
    public  static final String ID_CARD_REGEX = "^(\\d{9,12})$";
    public  static final String REGEX_STR = "[A-Z][a-z\\s]+$";
    public static final String REGEX_INT = "^([1-9]\\d{0,})$";
    public static final String REGEX_SEX = "^((Male)||(Female))$";


    // Khởi tạo 1 array list có kiểu dữ liệu là Customer
    private static List<Customer> customersList = new LinkedList<>();

    // tạo 1 biến scanner để lấy dữ liệu nhập của người dùng.
    private static Scanner scanner = new Scanner(System.in);
    @Override
    public void display() {
        for (Customer customer: customersList
             ) {
            System.out.println(customer.toString());
        }
    }

    private String inputID(){
        System.out.println("Nhập Id khách hàng: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, Id khách hàng phải là 1 chuỗi số");
    }
    private String inputName(){
        System.out.println("Nhập tên: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, Tên phải viết hoa chữ cái đầu");
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
    private String inputCustomerType(){
        System.out.println("Nhập loại khách hàng: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng! Vui lòng nhập lại.");
    }
    private String inputAddress(){
        System.out.println("Nhập dịa chỉ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng! Vui lòng nhập lại.");
    }

    @Override
    public void addNew() {
        int id = Integer.parseInt(inputID());
        String name = inputName();
        String cardId = inputCardId();
        System.out.println("Nhập ngày sinh khách hàng: ");
        String dateOfBirth = RegexData.regexAge(scanner.nextLine(), BIRTHDAY_REGEX );
        String sex = inputSex();
        String sdt = inputStd();
        String email = inputEmail();
        String customerType = inputCustomerType();
        String address = inputAddress();
        Customer customer = new Customer(id, name, dateOfBirth,
                cardId, sex, sdt, email,customerType, address );
        customersList.add(customer);
        System.out.printf("Thêm thành công!!! %n");
        // thêm xong thì return luôn . thêm không xong thì in ra thông báo

    }

    @Override
    public void edit() {
        try {
            System.out.printf("Nhập CustomerId cần update:");
            int id = Integer.parseInt(scanner.nextLine());
            for(int i= 0 ; i < customersList.size(); i++) {
                if(customersList.get(i).getId() == id) {
                    String name = inputName();
                    String cardId = inputCardId();
                    System.out.println("Nhập ngày sinh khách hàng: ");
                    String dateOfBirth = RegexData.regexAge(scanner.nextLine(), BIRTHDAY_REGEX );
                    String sex = inputSex();
                    String sdt = inputStd();
                    String email = inputEmail();
                    String customerType = inputCustomerType();
                    String address = inputAddress();
                    Customer customer = new Customer(id, name, dateOfBirth,
                            cardId, sex, sdt, email, customerType, address);
                    customersList.remove(i);
                    customersList.add(customer);
                    System.out.printf("Update thành công khách hàng có mã Id là: " + id + "%n");
                    return;
                }
            }
            System.out.println("Khách hàng không tồn tại!!!");
        } catch (NumberFormatException e) {
            System.out.println("Bạn đã nhập sai vui lòng nhập lại");
        }



    }

    @Override
    public void delete() {
        try {
            System.out.printf("Nhập CustomerId cần update:");
            int id = Integer.parseInt(scanner.nextLine());
            for(int i= 0 ; i < customersList.size(); i++) {
                if(customersList.get(i).getId() == id) {
                    customersList.remove(i);
                    System.out.printf("Xóa thành công!!! %n" );
                    return;
                }
            }
            System.out.printf("Không tồn tại nhân viên có mã: ", id ,"%n");
        } catch (NumberFormatException e) {
            System.out.println("Bạn đã nhập sai vui lòng nhập lại");
        }


    }
}

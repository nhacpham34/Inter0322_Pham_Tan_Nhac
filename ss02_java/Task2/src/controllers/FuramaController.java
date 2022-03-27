package controllers;

import services.Impl.CustomerServiceImpl;
import services.Impl.EmployeeServiceImpl;
import services.Impl.FacilityServiceImpl;

import java.util.Scanner;

public class FuramaController {
    public static   int choice;
// Hàm này hiển thị displayMainMenu && người dùng nhập để chọn
    public static void displayMainMenu() {
        boolean check = true ;
        while (check) {
            System.out.println("1. Employee Management");
            System.out.println("2. Customer Management");
            System.out.println("3. Facility  Management");
            System.out.println("4. Booking Management");
            System.out.println("5. Promotion Management");
            System.out.println("6. Exit");
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            // nhập để chọn
            Scanner scanner = new Scanner(System.in);
            switch (choice){
                case 1: {
                    displayEmployeeMenu();
                    break;
                }
                case 2: {
                    displayCustomerMenu();
                    break;
                }
                case 3: {
                    displayFacilityMenu();
                    break;
                }
                case 4 : {
                    displayBookingMenu();
                    break;
                }
                case 5 : {
                    displayPromotionMenu();
                    break;
                }
                case 6 : {
                    System.exit(0);
                }
            }
        }
    }

    //
    public  static void displayEmployeeMenu(){
        EmployeeServiceImpl employeeService = new EmployeeServiceImpl();
        boolean check = true ;
        while (check) {
            System.out.println("1. Display list employees");
            System.out.println("2. Add new employee");
            System.out.println("3. Edit employee");
            System.out.println("4. Back to Main menu");
            // nhập để chọn
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice){
                case 1: {
                    employeeService.display();
                    break;
                }
                case 2: {
                    employeeService.addNew();
                    break;
                }
                case 3 : {
                    employeeService.edit();
                    break;
                }
                case 4: {
                    displayMainMenu();
                    break;
                }
            }
        }
    }

    public  static void displayCustomerMenu(){
        CustomerServiceImpl customerService = new CustomerServiceImpl();
        boolean check = true ;
        while (check) {
            System.out.println("1. Display list customers");
            System.out.println("2. Add new customer");
            System.out.println("3. Edit customer");
            System.out.println("4. Back to Main menu");
            // nhập để chọn
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice){
                case 1: {
                    customerService.display();
                    break;
                }
                case 2 : {
                    customerService.addNew();
                    break;
                }
                case 3 : {
                    customerService.edit();
                    break;
                }
                case 4: {
                    displayMainMenu();
                    break;
                }
            }
        }
    }

    //

    public  static void displayFacilityMenu(){
        FacilityServiceImpl facilityService = new FacilityServiceImpl();
        boolean check = true ;
        while (check) {
            System.out.println("1. Display list Facility");
            System.out.println("2. Add new Facility");
            System.out.println("3. Display list Facility maintain");
            System.out.println("4. Edit Facility");
            System.out.println("5. Back to menu");
            // nhập để chọn
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice){
                case 1: {
                    facilityService.display();
                    break;
                }
                case 2: {
                    addNewFacilityMenu();
                    break;
                }
                case 5: {
                    displayMainMenu();
                    break;
                }
            }
        }


    }
    public  static void addNewFacilityMenu() {
        FacilityServiceImpl facilityService = new FacilityServiceImpl();
        boolean check = true;
        while (check) {
            System.out.println("1. Add new Villa");
            System.out.println("2. Add new House");
            System.out.println("3. Add new Room");
            System.out.println("4. Back to Facility menu");
            // nhập để chọn
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            } catch (NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice) {
                case 1: {
                    facilityService.addNewVilla();
                    displayFacilityMenu();
                    break;
                }
                case 2: {
                    facilityService.addNewHouse();
                    displayFacilityMenu();
                    break;
                }
                case 3: {
                    facilityService.addNewRoom();
                    displayFacilityMenu();
                    break;
                }
                case 4: {
                    displayFacilityMenu();
                    break;
                }
            }
        }
    }
//    edit Facility
        public  static void EditFacilityMenu(){
            FacilityServiceImpl facilityService = new FacilityServiceImpl();
            boolean check = true ;
            while (check) {
                System.out.println("1. Edit Villa");
                System.out.println("2. Edit House");
                System.out.println("3. Edit Room");
                System.out.println("4. Back to Facility menu");
                // nhập để chọn
                try {
                    Scanner scanner = new Scanner(System.in);
                    choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
                }
                catch(NumberFormatException e) {
                    System.out.println("Nhập lỗi vui lòng nhập lại!!");
                }
                switch (choice){
                    case 1: {
                        facilityService.addNewVilla();
                        displayFacilityMenu();
                        break;
                    }
                    case 2: {
                        facilityService.addNewHouse();
                        displayFacilityMenu();
                        break;
                    }
                    case 3: {
                        facilityService.addNewRoom();
                        displayFacilityMenu();
                        break;
                    }
                    case 4: {
                        displayFacilityMenu();
                        break;
                    }
                }
            }
    }
    //

    public  static void displayBookingMenu(){
        boolean check = true ;
        while (check) {
            System.out.println("1. Add new Booking");
            System.out.println("2. Display list Booking");
            System.out.println("3. Create new constracts");
            System.out.println("4. Display list contracts");
            System.out.println("5. Edit contracts");
            System.out.println("6. Return main menu");
            // nhập để chọn
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice){
                case 1: {

                }
                case 6: {
                    displayMainMenu();
                    break;
                }
            }
        }
    }

    //
    public  static void displayPromotionMenu() {
        boolean check = true;
        while (check) {
            System.out.println("1. Display list customers use service");
            System.out.println("2. Display list customers get voucher");
            System.out.println("3. Return main menu");
            try {
                Scanner scanner = new Scanner(System.in);
                choice = Integer.parseInt(String.valueOf(scanner.nextLine()));
            }
            catch(NumberFormatException e) {
                System.out.println("Nhập lỗi vui lòng nhập lại!!");
            }
            switch (choice) {
                case 1: {

                }
                case 3: {
                    displayMainMenu();
                    break;
                }
            }
        }
    }

}

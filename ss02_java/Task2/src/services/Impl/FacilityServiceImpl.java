package services.Impl;

import models.Facility;
import models.FacilityHouse;
import models.FacilityRoom;
import models.FacilityVilla;
import services.FacilityService;
import utils.RegexData;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;

public class FacilityServiceImpl implements FacilityService {
// Khai báo chuẩn hóa dữ liệu:
    public static final String REGEX_STR = "[A-Z][a-z]+";
    public static final String REGEX_ID_VILLA = "(SVVL)[-][\\d]{4}";
    public static final String REGEX_ID_HOUSE = "[SVHO][-][\\d]{4}";
    public static final String REGEX_ID_ROOM = "[SVRO][-][\\d]{4}";
    public static final String REGEX_AMOUNT = "^[1-9]|[1][0-9]|(20)$";
    public static final String REGEX_AREA = "^([3-9]\\d|[1-9]\\d{2,})$";
    public static final String REGEX_INT = "^([1-9]\\d{0,})";




//    Tạo 1 facilityMap
    private static Map<Facility, Integer> facilityIntegerMap = new LinkedHashMap<>();
    private static Scanner scanner = new Scanner(System.in);
    @Override
    public void display() {
        for (Map.Entry<Facility, Integer> element : facilityIntegerMap.entrySet()) {
            System.out.println("Service" + element.getKey() + "Số lần đã thuê: " + element.getValue());
        }
    }

    @Override
    public void displayMaintain() {

    }

    @Override
    public void addNewVilla() {

        String id = inputIdVilla();
        String nameService = inputName();
        double areaUse = Double.parseDouble(inputArea());
        double rentalPrice = Double.parseDouble(inputPrice());
        int rentalPeopleMax =  Integer.parseInt(inputPeopleMax());
        String styleRental = inputStyleRental();
        String standardVilla = inputStandardRental();
        float areaPool = Float.parseFloat(inputAreaPool());
        int floor = Integer.parseInt(inputFloor());
        FacilityVilla villa = new FacilityVilla(id, nameService,areaUse,rentalPrice,rentalPeopleMax,styleRental,standardVilla,areaPool,floor);
        facilityIntegerMap.put(villa, 0);
        System.out.println("Đã thêm mới Villa thành công!");
    }

    private String inputIdVilla(){
        System.out.println("Nhập id, mã dịch vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_ID_VILLA,
                "Bạn đã nhập sai định dạng, mã dịch vụ phải có định dạng SVVL-XXXX");
    }
    private String inputIdHouse(){
        System.out.println("Nhập id, mã dịch vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_ID_HOUSE,
                "Bạn đã nhập sai định dạng, mã dịch vụ phải có định dạng SVVL-XXXX");
    }
    private String inputIdRoom(){
        System.out.println("Nhập id, mã dịch vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_ID_ROOM,
                "Bạn đã nhập sai định dạng, mã dịch vụ phải có định dạng SVVL-XXXX");
    }

    private String inputName(){
        System.out.println("Nhập tên dịch vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, tên dịch vụ phải viết hoa chữ cái đầu.");
    }

    private String inputStyleRental(){
        System.out.println("Nhập kiểu thuê: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, kiểu thuê phải viết hoa chữ cái đầu.");
    }

    private String inputStandardRental(){
        System.out.println("Nhập tiêu chuẩn phòng: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, tiêu chuẩn phòng phải viết hoa chữ cái đầu.");
    }

    private String inputFreeService(){
        System.out.println("Nhập tiêu chuẩn phòng: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_STR,
                "Bạn đã nhập sai định dạng, Dịch vụ miễn phí phải viết hoa chữ cái đầu.");
    }

    private String inputAreaPool(){
        System.out.println("Nhập diện thích hồ bơi: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, diện tích phải là số dương.");
    }

    private String inputArea(){
        System.out.println("Nhập diện tích dịch vụ: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_AREA,
                "Bạn đã nhập sai định dạng, diện tích phải lớn hơn 30");
    }

    private String inputPeopleMax(){
        System.out.println("Nhập số người tối đa: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_AMOUNT,
                "Bạn đã nhập sai định dạng, số người tối đa từ 1-20");
    }

    private String inputPrice(){
        System.out.println("Nhập số tiền phải trả: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, số tiền phải trả phải là số nguyên dương");
    }

    private String inputFloor(){
        System.out.println("Nhập số tầng: ");
        return RegexData.regexStr(scanner.nextLine(),REGEX_INT,
                "Bạn đã nhập sai định dạng, số tầng phải là số nguyên dương");
    }


    @Override
    public void addNewHouse() {
        String id = inputIdHouse();
        String nameService = inputName();
        double areaUse = Double.parseDouble(inputArea());
        double rentalPrice = Double.parseDouble(inputPrice());
        int rentalPeopleMax =  Integer.parseInt(inputPeopleMax());
        String styleRental = inputStyleRental();
        String standardHouse = inputStandardRental();
        int floor = Integer.parseInt(inputFloor());
        FacilityHouse house = new FacilityHouse(id, nameService,areaUse,rentalPrice,rentalPeopleMax,styleRental,standardHouse,floor);
        facilityIntegerMap.put(house, 0);
        System.out.println("Đã thêm mới house thành công!");
    }

    @Override
    public void addNewRoom() {
        String id = inputIdRoom();
        String nameService = inputName();
        double areaUse = Double.parseDouble(inputArea());
        double rentalPrice = Double.parseDouble(inputPrice());
        int rentalPeopleMax =  Integer.parseInt(inputPeopleMax());
        String styleRental = inputStyleRental();
        System.out.printf("Nhập dịch vụ miễn phí đi kèm: ");
        String freeService = inputFreeService();
        FacilityRoom room = new FacilityRoom(id, nameService,areaUse,rentalPrice,rentalPeopleMax,styleRental,freeService
        );
        facilityIntegerMap.put(room, 0);
        System.out.println("Đã thêm mới room thành công!");
    }
}

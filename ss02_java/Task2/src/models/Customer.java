package models;

public class Customer extends Person {
    private String customerType;
    private String address;

    public Customer(int id,
                    String name,
                    String dateOfBirth,
                    String idCard,
                    String sex,
                    String sdt,
                    String email,
                    String customerType,
                    String address) {
        super(id, name, dateOfBirth, idCard, sex, sdt, email);
        this.customerType = customerType;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer{" +  super.toString() +
                "customerType='" + customerType + '\'' +
                ", address='" + address + '\'' +
                "} " ;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

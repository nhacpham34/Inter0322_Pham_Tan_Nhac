package models;

public abstract class Person {
    private int Id;
    private  String name;
    private String dateOfBirth;
    private String idCard;
    private String sex;
    private String sdt;
    private String email;

    public Person(int id, String name, String dateOfBirth, String idCard, String sex, String sdt, String email) {
        Id = id;
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.idCard = idCard;
        this.sex = sex;
        this.sdt = sdt;
        this.email = email;
    }

    public Person() {

    }

//    toString()


    @Override
    public String toString() {
        return
                "Id=" + Id +
                ", name='" + name + '\'' +
                ", dateOfBirth=" + dateOfBirth +
                ", idCard='" + idCard + '\'' +
                ", sex='" + sex + '\'' +
                ", sdt='" + sdt + '\'' +
                ", email='" + email + '\'' ;
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return dateOfBirth;
    }

    public void setAge(String age) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

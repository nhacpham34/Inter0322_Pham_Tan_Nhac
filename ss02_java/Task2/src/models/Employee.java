package models;

import java.util.Objects;

public class Employee extends Person {
    private String level;
    private String position;
    private double wage;

    public Employee(int id
            , String name
            , String dateOfBirth
            , String idCard
            , String sex
            , String sdt
            , String email
            , String level
            , String position
            , double wage) {
        super(id, name, dateOfBirth, idCard, sex, sdt, email);
        this.level = level;
        this.position = position;
        this.wage = wage;
    }

    @Override
    public String toString() {
        return "Employee{" + super.toString() +
                "level='" + level + '\'' +
                ", position='" + position + '\'' +
                ", wage=" + wage +
                "} " ;
    }



    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getWage() {
        return wage;
    }

    public void setWage(double wage) {
        this.wage = wage;
    }
}

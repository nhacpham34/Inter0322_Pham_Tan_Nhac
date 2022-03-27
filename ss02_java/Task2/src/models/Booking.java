package models;

import java.util.Date;

public class Booking {
    private int bookingId;
    private String dayStart;
    private String dayEnd;
    private Customer customer;
    private Facility facility;

    public Booking(int bookingId, String dayStart, String dayEnd, Customer customer, Facility facility) {
        this.bookingId = bookingId;
        this.dayStart = dayStart;
        this.dayEnd = dayEnd;
        this.customer = customer;
        this.facility = facility;
    }

    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getDayStart() {
        return dayStart;
    }

    public void setDayStart(String dayStart) {
        this.dayStart = dayStart;
    }

    public String getDayEnd() {
        return dayEnd;
    }

    public void setDayEnd(String dayEnd) {
        this.dayEnd = dayEnd;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Facility getFacility() {
        return facility;
    }

    public void setFacility(Facility facility) {
        this.facility = facility;
    }
}

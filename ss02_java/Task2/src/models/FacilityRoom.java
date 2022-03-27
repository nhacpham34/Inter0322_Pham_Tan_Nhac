package models;

public class FacilityRoom extends Facility {
    private String freeServe;

    public FacilityRoom(String idFacility,
                        String nameService,
                        double areaUse,
                        double rentalPrice,
                        int rentalPeopleMax,
                        String styleRental,
                        String freeServe) {
        super(idFacility, nameService, areaUse, rentalPrice, rentalPeopleMax, styleRental);
        this.freeServe = freeServe;
    }

    @Override
    public String toString() {
        return "FacilityRoom{" + super.toString() +
                "freeServe='" + freeServe + '\'' +
                "} " ;
    }

    public String getFreeServe() {
        return freeServe;
    }

    public void setFreeServe(String freeServe) {
        this.freeServe = freeServe;
    }
}

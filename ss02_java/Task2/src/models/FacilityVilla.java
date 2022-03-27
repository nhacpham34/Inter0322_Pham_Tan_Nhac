package models;

public class FacilityVilla extends Facility {
    private String standardVilla ;
    private double areaPool;
    private int floor;

    public FacilityVilla(String idFacility,
                         String nameService,
                         double areaUse,
                         double rentalPrice,
                         int rentalPeopleMax,
                         String styleRental,
                         String standardVilla,
                         double areaPool,
                         int floor) {
        super(idFacility, nameService, areaUse, rentalPrice, rentalPeopleMax, styleRental);
        this.standardVilla = standardVilla;
        this.areaPool = areaPool;
        this.floor = floor;
    }

    @Override
    public String toString() {
        return "FacilityVilla{" + super.toString() +
                "standardVilla='" + standardVilla + '\'' +
                ", areaPool=" + areaPool +
                ", floor=" + floor +
                "}" ;
    }

    public String getStandardVilla() {
        return standardVilla;
    }

    public void setStandardVilla(String standardVilla) {
        this.standardVilla = standardVilla;
    }

    public double getAreaPool() {
        return areaPool;
    }

    public void setAreaPool(double areaPool) {
        this.areaPool = areaPool;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }
}

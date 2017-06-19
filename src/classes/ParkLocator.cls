public with sharing class ParkLocator {
    public static String[] country(String countryName){
        ParkService.ParksImplPort parksImplPort = new ParkService.ParksImplPort();

        return parksImplPort.byCountry(countryName);
    }
}
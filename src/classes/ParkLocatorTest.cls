@isTest
public with sharing class ParkLocatorTest {
    public static testMethod void getParkNamesByCountry(){
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        String[] expectedArray = new String[3];
        expectedArray[0] = 'Nuñez y Navarro';
        expectedArray[1] = 'Saba';
        expectedArray[2] = 'BSM';
        System.assertEquals(expectedArray, ParkLocator.country('Spain'));
    }
}
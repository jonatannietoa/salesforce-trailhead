@isTest
private class AnimalLocatorTest {
    public static testMethod void testGetAnimal() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        HttpResponse response = AnimalsCallouts.makePostCallout();

        System.assertEquals('chicken', AnimalLocator.getAnimalNameById(1));
    }

    public static testMethod void testGetAnimalWithIdNotFound() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMockAnimalNotFoundMock());
        HttpResponse response = AnimalsCallouts.makePostCallout();

        try{
            AnimalLocator.getAnimalNameById(0);
        }catch (AnimalLocatorException e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('Animal not found.') ? true : false;
            System.AssertEquals(expectedExceptionThrown, true);
        }
    }

    public static testMethod void testGetAnimalAPIError() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorApiErrorMock());
        HttpResponse response = AnimalsCallouts.makePostCallout();

        try{
            AnimalLocator.getAnimalNameById(0);
        }catch (AnimalLocatorException e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('Animal API error.') ? true : false;
            System.AssertEquals(expectedExceptionThrown, true);
        }
    }
}
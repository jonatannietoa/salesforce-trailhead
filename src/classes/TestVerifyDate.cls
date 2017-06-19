@isTest
public class TestVerifyDate {
    static testMethod void testDateWithin30Days(){
        Date date1 = date.newInstance(2017, 5, 10);
        Date date2 = date.newInstance(2017, 5, 31);
    	
        System.assertEquals(date2, VerifyDate.CheckDates(date1, date2));
    }
    
    static testMethod void testDateNotWithin30Days(){
        Date date1 = date.newInstance(2017, 5, 10);
        Date date2 = date.newInstance(2017, 6, 29);
    	
        System.assertEquals(date.newInstance(2017, 5, 31), VerifyDate.CheckDates(date1, date2));
    }
    
    static testMethod void testDateDate1BiggerThanDate2(){
        Date date1 = date.newInstance(2017, 5, 15);
        Date date2 = date.newInstance(2017, 5, 10);
    	
        System.assertEquals(date.newInstance(2017, 5, 31), VerifyDate.CheckDates(date1, date2));
    }
}
@isTest
private class TaskUtilTest {
    static testMethod void testTaskPriorityNY() {
        String pri = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', pri);
    }
    
    static testMethod void testTaskPriorityCA() {
        String pri = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', pri);
    }
    
    static testMethod void testTaskPriorityWithoutCorrectState() {
        String pri = TaskUtil.getTaskPriority('ESP');
        System.assertEquals(null, pri);
    }
    
    static testMethod void testTaskPriorityWithBlankState() {
        String pri = TaskUtil.getTaskPriority(null);
        System.assertEquals(null, pri);
    }
}
/**
 * Created by jonatan.nieto on 16/06/2017.
 */

@IsTest
private class BusScheduleCacheTest {
    static testMethod void testBehavior() {
        BusScheduleCache busScheduleCache = new BusScheduleCache();
        for (Integer i = 0; i < 2000; i++){
            Time[] schedule = new Time[2];
            schedule[0] = Time.newInstance(8, 0, 0, 0);
            schedule[1] = Time.newInstance(17, 0, 0, 0);

            busScheduleCache.putSchedule('Line' + i, schedule);
        }

        Time[] cacheSchedule = (Time[])busScheduleCache.getSchedule('Line777');
        System.assertEquals(cacheSchedule.size(), 2);
    }
}
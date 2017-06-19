/**
 * Created by jonatan.nieto on 16/06/2017.
 */

public with sharing class BusScheduleCache {
    private Cache.OrgPartition part;

    public BusScheduleCache(){
        this.part = new Cache.OrgPartition('local.BusSchedule');
    }

    public void putSchedule(String busLine, Time[] schedul){
        part.put(busLine, schedul);
    }

    public Time[] getSchedule(String busLine){
        Time[] cacheSchedule = (Time[])part.get(busLine);
        if(null==cacheSchedule){
            cacheSchedule = new Time[2];
            cacheSchedule[0] = Time.newInstance(8,0,0,0);
            cacheSchedule[1] = Time.newInstance(17,0,0,0);
            return cacheSchedule;
        }else{
            return cacheSchedule;
        }
    }
}
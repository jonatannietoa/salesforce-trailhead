public class StringArrayTest {  
    public static List<String> generateStringArray(Integer numIterations){
        List<String> generateStringArray = new List<String>();
        for(Integer i=0; i < numIterations; i++){
            generateStringArray.add('Test ' + i);
        }
        return generateStringArray;
    }  
}
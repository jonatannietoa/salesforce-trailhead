public class AnimalLocator {
    public static String getAnimalNameById(Integer idAnimal){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + idAnimal);
        request.setMethod('GET');
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');

            if(animal.get('id') != 0){
                return (String)animal.get('name');
            }else{
                throw new AnimalLocatorException('Animal not found.');
            }
        }else{
            throw new AnimalLocatorException('Animal API error.');
        }
    }
}
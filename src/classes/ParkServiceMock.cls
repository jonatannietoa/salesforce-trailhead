@isTest
global class ParkServiceMock implements WebServiceMock{
    global void doInvoke(
            Object stub,
            Object request,
            Map<String, Object> response,
            String endpoint,
            String soapAction,
            String requestName,
            String responseNS,
            String responseName,
            String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();

        String[] parkingArray = new String[3];
        parkingArray[0] = 'Nuñez y Navarro';
        parkingArray[1] = 'Saba';
        parkingArray[2] = 'BSM';

        response_x.return_x = parkingArray;
        // end
        response.put('response_x', response_x);
    }
}
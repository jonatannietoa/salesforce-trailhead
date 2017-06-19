@isTest
global class AnimalLocatorApiErrorMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('Not Found');
        response.setStatusCode(404);
        return response;
    }
}
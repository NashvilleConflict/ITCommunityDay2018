@isTest
public class RequestHandlerTest{
    @isTest private static void handleRequestsTest(){
        //given
        RequestParameter parameter = new RequestParameter();
        parameter.method='POST';
        parameter.namedCredential='Twilio';
        parameter.URI='uri';
        parameter.body='body';
        parameter.storeResponses=true;
        //if
        Test.setMock(HttpCalloutMock.class, new RequestHandlerTestMock());
        Test.startTest();
            RequestHandler.handleRequests(new RequestParameter[]{parameter});
        Test.stopTest();
        //then
        system.AssertEquals(1,[SELECT COUNT() FROM Request_Response__c]);
    }
}
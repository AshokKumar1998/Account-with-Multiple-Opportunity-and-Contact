public class call_api {
     
    public static void get_access(){

        Http h = new Http();

        HttpRequest request  = new HttpRequest();

		String body = '[{"key":"grant_type","value":"password","description":"","type":"text"},{"key":"client_id","value":"3MVG9n_HvETGhr3CCxqyBWt1kXlQMwutOWELXA3zBXcSclPdw4JGRylrgkKlR4NxGAfCtufuRCtEa88H6mmNH","description":"","type":"text","enabled":true},{"key":"client_secret","value":"59B33D36ECFAE04EBFA0132FB1B0CD612D41B5E6E0C6704390A04FF971ABA35C","description":"","type":"text","enabled":true},{"key":"username","value":"kumar@poornima.com","description":"","type":"text","enabled":true},{"key":"password","value":"Kohsa@8991NZBx1XmXzasNLXVrVI7tAA8j","description":"","type":"text","enabled":true}]';
        request.setBody(body);
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        request.setMethod('POST');

         System.debug('Data Request '+request);
        HttpResponse response = h.send(request);
    

        System.debug('Data Recived '+response);


    }
    
    
    @future(callout=true)
    public static void send_acc(String name){

		utility.isFutureUpdate = true;
        Http h = new Http();

        HttpRequest request  = new HttpRequest();

        request.setHeader('Authorization', 'Bearer 00D2w000002AaGw!ARkAQNi37FzHWESCpgD.kvq6ad6zO.XS9An.l3WzL_SttfrUIHZnuUHQKgMbKHk00dUFxlGh.l8NtY2vTQ60kyKmU.OxS99g');
        request.setHeader('Content-Type', 'application/json');
		String body = '{"Name":"Vijaya"}';
        request.setBody(body);
        request.setEndpoint('https://ap16.salesforce.com/services/apexrest/CreateAcc/');
        request.setMethod('POST');

        HttpResponse response = h.send(request);
    

        System.debug('Data Recived '+response);


    }
}
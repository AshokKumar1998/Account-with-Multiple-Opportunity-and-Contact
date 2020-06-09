public class SendAccountUsingRESTAPI {
    private final String clientId = '3MVG9n_HvETGhr3CCxqyBWt1kXlSdj.OwDJSklbR884SIhXm8LM69wGdobnNzOjjXzeYAO33JnczN4SOmo.8J';
    private final String clientSecret = '3BC921373255DC9152BD6601B4D75E2F57C1D108169FA96DC053C0438935BE14';
    private final String username = 'kumar@poornima.com';
    private final String password = 'Kohsa@1998sUbgVQyIVUtcNKByvaf8lD2d';
    public class deserializeResponse
    {
        public String id;
        public String access_token;
    }
    public String ReturnAccessToken (SendAccountUsingRESTAPI acount)
    {
        String reqbody = 'grant_type=password&client_id='+clientId+'&client_secret='+clientSecret+'&username='+username+'&password='+password;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        deserializeResponse resp1 = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
        system.debug('@@@@access_token@@'+resp1+' body '+res.getbody() );
        return resp1.access_token;
    }
    @future (callout=true)  
    public static void callgetContact (String acc_json)
    {
        SendAccountUsingRESTAPI acount1 = new SendAccountUsingRESTAPI();
        String accessToken;
        accessToken = acount1.ReturnAccessToken (acount1);
        list<Contact> LstContact=new List<Contact>();
        if(accessToken != null){
            String endPoint = 'https://ap16.salesforce.com/services/apexrest/getAccount/';
            Http h2 = new Http(); 
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setMethod('GET');
            req1.setHeader('data',acc_json);
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            system.debug('@@@RESPONSE@@'+res1);
        }
    }
    
}
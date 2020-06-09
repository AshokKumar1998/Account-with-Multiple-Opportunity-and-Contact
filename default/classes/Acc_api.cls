@RESTResource(urlMapping='/CreateAccount/')
global class Acc_api {


    @HTTPGet
    global static String create_account(){
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        id i = request.headers.get('id');
        
        Account record = [ Select id from Account where id = :i];
        delete record;
        return 'deleted '+record;
    }
    
    
    @HTTPPost
    global static String create(){
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        String field_name, field_value;

        id i = request.headers.get('id');
        
        String body = request.requestBody.toString();
        
        JSONParser parser = JSON.createParser(body);
        
        System.debug('Body '+body+'             parser '+parser);
        
        Account acc  = [ select name, NumberOfEmployees, AccountNumber from Account where id = :i ];
        
        while ( parser.nextToken() != null ){
            
            if ( parser.getCurrentToken() != JSONToken.END_OBJECT ){
                
                field_name = parser.getCurrentName();
                field_value = parser.getText();
                
                if ( field_name == 'Name' ){
                    acc.name = field_value;
                }else if( field_name == 'AccountNumber' ){
                    acc.AccountNumber = field_value;
                }else if( field_name == 'NumberOfEmployees' ){
                    acc.NumberOfEmployees =Integer.valueOf(field_value);
                }
            }
          
            
        }

        Database.update(acc,false);
        
        return 'All Done '+acc;
        
    }
    
    
    
    global static String create_multi(){
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        String field_name, field_value, name, acc_num;
        
        Integer  noe;

        id i = request.headers.get('id');
        
        String body = request.requestBody.toString();
        
        JSONParser parser = JSON.createParser(body);
        
        System.debug('Body '+body+'             parser '+parser);
        
        list<Account> acc =(list<Account>) JSON.deserialize(body, list<Account>.class );
        
        Database.insert(acc,false);
        
        return 'All Done '+acc;
        
    }
    
}
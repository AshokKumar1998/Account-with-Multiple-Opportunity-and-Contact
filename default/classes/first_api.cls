@RESTResource(urlMapping='/CreateLead/')
global class first_api {

    @HTTPGet
    global static String sendlead(){
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        id i = request.headers.get('id');
        
        SObject record = [ Select firstname from Lead where id = :i];
        
        return ''+record;
        
    }
    
    
    
    @HTTPPost
    global static String create(){
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;
        
        String field_name, field_value, fname, lname, comp;
        
        String body = request.requestBody.toString();
        
        JSONParser parser = JSON.createParser(body);
        
        System.debug('Body '+body+'             parser '+parser);
        
        list<Account> le = new list<Account>();
        
        while ( parser.nextToken() != null ){
            
            if ( parser.getCurrentToken() != JSONToken.END_OBJECT ){
                
                field_name = parser.getCurrentName();
                field_value = parser.getText();
                
                if ( field_name == 'Name' ){
                    fname = field_value;
                }
            }
            le.add(new Account(name = fname));
            
        }
        
        System.debug('Recived Data : '+le);
        Database.insert(le,false);
        
        return 'All Done '+le;
        
    }
    
}
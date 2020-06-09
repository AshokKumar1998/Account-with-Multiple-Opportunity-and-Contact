public class ass4help {
    
    
    
    public static void q5( set<id> rec ){
        
        list<Account> record = [ select Rating, CustomerPriority__c from Account where id in :rec ];
        
        for ( Account a : record ){

            a.Rating =  'Hot';
            a.CustomerPriority__c = 'High';
            
        }
        update record;
        
    }

    

}
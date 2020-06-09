public with sharing class Account_Controller {
    
    @AuraEnabled
    public static list<Account> search_account(list<id> acc){
        System.debug(acc);
        list<Account> searchacc = [ select Name, id, Ashoka__Email__c, Phone from Account where id in :acc ];
        System.debug(searchacc);
        return searchacc;
    }
    
    @AuraEnabled
    public static ID insert_account(Account a,list<Contact> con, list<Opportunity> opp){
        
        insert a;
        
        if ( con == null ){
            con = new list<Contact>();
            // con.add( new Contact(lastname = 'No Name') );
        }
        if ( opp == null ){
            opp = new list<Opportunity>();
            // con.add( new Contact(lastname = 'No Name') );
        }
        
        for ( Opportunity o : opp ){
            o.accountid = a.id;
        }
        System.debug('-> '+opp);
        try{
            Database.insert( opp );
            System.debug('---> '+opp);
        }catch(Exception e){
            System.debug('error  '+e.getMessage());
        }
        
        
        for ( Contact c : con ){
            c.accountid = a.id;
        }
        
        Database.insert( con, false );
        
        system.debug(a);
        system.debug(con);
        
        return a.id;
    }
    
     @AuraEnabled
    public static Account insert_accounts(Account a){
        System.debug('acc : '+a);
        insert a;
        return a;
    }
    
     @AuraEnabled
    public static ID insert_account_opp_con(Account a,list<Contact> con, list<Opportunity> opp){
        insert a;
        id i = a.Id;
        
        if ( con == null ){
            con = new list<Contact>();
            // con.add( new Contact(lastname = 'No Name') );
        }
        if ( opp == null ){
            opp = new list<Opportunity>();
            // con.add( new Contact(lastname = 'No Name') );
        }
        
        for ( Opportunity o : opp ){
            o.accountid = i;
        }
        System.debug('-> '+opp);
        try{
            Database.insert( opp );
            System.debug('---> '+opp);
        }catch(Exception e){
            System.debug('error  '+e.getMessage());
        }
        
        
        for ( Contact c : con ){
            c.accountid = i;
        }
        
        Database.insert( con, false );
        
        system.debug(con);
        
        return i;
    }
    
}
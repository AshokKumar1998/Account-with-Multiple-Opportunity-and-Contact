public class counter_helper {
    
     public static map<id,Account> get_new_map2(list<Opportunity> opp){
        map<id,account> accounts = new map<id,account>();
        
        for(opportunity o:opp) {
        
            //if ( o.StageName == 'Closed Won' || o.StageName == 'Closed Lost')
                accounts.put(o.accountid,null);
        
        }
       
        accounts.remove(null);
        
        accounts.putAll([select id,name,Counter__c from account where id in :accounts.keyset()]);
        return accounts;
    }
    
    
    public static map<id,Account> get_new_map(list<Opportunity> opp){
        map<id,account> accounts = new map<id,account>();
        
        for(opportunity o:opp) {
        
            if ( o.StageName == 'Closed Won' || o.StageName == 'Closed Lost')
                accounts.put(o.accountid,null);
        
        }
       
        accounts.remove(null);
        
        accounts.putAll([select id,name,Counter__c from account where id in :accounts.keyset()]);
        return accounts;
    }
    
    
    public static list<id> only_for_update(list<Opportunity> opp){
        list<id> accounts = new list<id>();
        
        for(opportunity o:opp) {
        
             accounts.add(o.id);
        
        }
       return accounts;
    }

}
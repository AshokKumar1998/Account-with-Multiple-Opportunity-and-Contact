trigger counter on Opportunity (after insert, after update, before delete, after undelete) {

    if ( trigger.isbefore ){
        
         if ( Trigger.isdelete ){
            
             map<id,Account> accounts = counter_helper.get_new_map(Trigger.old);
                System.debug('map '+accounts);
                list<account> acc = new list<account>();
            
                    for ( Opportunity o : Trigger.old ){
            
                        if(accounts.containskey(o.accountid)) {
                            Account a = accounts.get(o.accountid);
                            a.Counter__c = a.Counter__c - 1; 
                            acc.add(a);
                        }
                
                    }
            update acc;
            
        }
        
       
    } 
    
    
    else if ( trigger.isafter ){
     
            if ( Trigger.isinsert ){
            
                map<id,Account> accounts = counter_helper.get_new_map(Trigger.new);
                System.debug('map '+accounts);
                list<account> acc = new list<account>();
            
                    for ( Opportunity o : Trigger.new ){
            
                        if(accounts.containskey(o.accountid)) {
                            Account a = accounts.get(o.accountid);
                            a.Counter__c = a.Counter__c+1; 
                            acc.add(a);
                        }
                
                    }
            update acc;
            }
        
                if ( Trigger.isupdate ){
                
                    map<id,Opportunity> opp_new = Trigger.newmap;
                    map<id,Account> accounts = counter_helper.get_new_map2(Trigger.new);
                    map<id,Opportunity> opp_old = Trigger.oldmap;
                    list<id> aid = counter_helper.only_for_update(Trigger.new);
                  
                    list<account> acc = new list<account>();
                       
                        for ( ID a : aid ){
                            
                            Opportunity o = opp_old.get(a);
                            Opportunity n = opp_new.get(a);
                            
                        System.debug('Old  '+o);
                            System.debug('new  '+n);
                            
                            if ( o.StageName == 'Closed Lost' || o.StageName == 'Closed Won' ){
                                
                                if ( n.StageName == 'Closed Lost' || n.StageName == 'Closed Won' ){
                                    
                                }else if ( n.StageName != 'Closed Lost' && n.StageName != 'Closed Won'  ){
                                     Account aa = accounts.get(o.accountid);
                                     aa.Counter__c = aa.Counter__c - 1; 
                                     acc.add(aa);
                                }
                                
                            }else if ( o.StageName != 'Closed Lost' && o.StageName != 'Closed Won' ){
                                
                                if ( n.StageName != 'Closed Lost' && n.StageName != 'Closed Won' ){
                                    
                                }else if ( n.StageName == 'Closed Lost' || n.StageName == 'Closed Won' ){
                                    Account aa = accounts.get(o.accountid);
                                     aa.Counter__c = aa.Counter__c+1; 
                                     acc.add(aa);
                                }
                                
                            }
                            
                        }
                           
                    update acc;
                    }
        
            
       if ( Trigger.isundelete ){
            
                map<id,Account> accounts = counter_helper.get_new_map(Trigger.new);
                System.debug('map '+accounts);
                list<account> acc = new list<account>();
            
                    for ( Opportunity o : Trigger.new ){
            
                        if(accounts.containskey(o.accountid)) {
                            Account a = accounts.get(o.accountid);
                            a.Counter__c = a.Counter__c+1; 
                            acc.add(a);
                        }
                
                    }
            update acc;
            }
            
        }


}
trigger acc_con on Account (before update) {

    
    map<id,account> acc = Trigger.newmap;
    list<Opportunity> con = [ select name, accountid, closedate from Opportunity where accountid in :acc.keySet() ];
    
    for ( Opportunity o : con ){
        
        Account a = acc.get(o.accountid);
        o.closedate = date.valueOf(a.createdDate) + 30;
        
    }
    
    update con;
    
    
}
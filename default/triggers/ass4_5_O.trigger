trigger ass4_5_O on Opportunity (before insert) {

    list<Account> acc = new list<Account>();
    set<id> rec = new set<id>();
    
    for ( Opportunity o : Trigger.new ){
        
            

        if (o.amount > 10000){
            rec.add(o.accountid);
        }
        
    }

    ass4help.q5( rec );
    
    
}
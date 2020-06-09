trigger Ass4_new on Account (before delete) {


    System.debug('delete called on account');
    list<Opportunity> opp = [ select name, Stagename, accountid from Opportunity where accountid != null ];
    map<id,list<Opportunity>> rec = new map<id,list<Opportunity>>();
    
    for( Opportunity o: opp ){
        
        if ( rec.containsKey(o.accountid) ){
            List<Opportunity> op = rec.get(o.accountid);
            op.add(o);
            rec.put(o.accountid, op);
        }else{
            rec.put(o.accountid,new list<Opportunity>{o});
        }
        
    }
    
    System.debug('map  '+rec);
    
    for( Account acc : trigger.old ){
      
        List<Opportunity> op = rec.get(acc.id);
        for ( Opportunity o : op ){
            System.debug('Opp  '+o);
            if (o.StageName == 'Closed Won' || o.StageName == 'Closed Lost' ){
            
            }else{
                acc.adderror(' You can\'t delete Open Opportunity');
            }
        }
        
    }
    

}
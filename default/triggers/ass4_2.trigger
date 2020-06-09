trigger ass4_2 on Opportunity (before insert) {
        
    list<Opportunity> opp = [ select name, accountid from Opportunity where accountid != null ];
    map<String,id> rec = new map<String,id>();
    
    for( Opportunity o: opp ){
        
        rec.put(o.name,o.accountid);
        
    }
    
    System.debug('map  '+rec);
    
    for( Opportunity o : trigger.new ){
      
        System.debug('new name  '+o.name);
        
        if ( rec.containsKey(o.name) ){
            System.debug('same one name  '+o.name);
            if( rec.get(o.name) == o.accountid ){
                o.name+= ' Dupplicate opportunity';
            }
        }
        
    }
    
}
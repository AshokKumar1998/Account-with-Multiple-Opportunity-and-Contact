trigger currency_update on Opportunity (after update, after insert) {

     if(utility.isFutureUpdate != true)
     {
       list<id> i = new list<id>();
        
        for ( Opportunity o : Trigger.new ){
                    i.add(o.Id);
                
            }
            
        //call_api.call(i);
    
    }
    
}
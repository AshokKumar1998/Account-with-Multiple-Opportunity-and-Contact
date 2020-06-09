trigger ass_4_8 on Opportunity (before update) {

    Map<id,list<task>> tasks = new Map<Id,list<task>>();
    list<task> tt = [ select Status, WhatId from task ];

    for ( task t : tt ){
        if ( tasks.containsKey(t.WhatId) ){
            list<task> tn = tasks.get(t.WhatId);
            tn.add(t);
            tasks.put(t.WhatId,tn);
        }else{
            
            tasks.put(t.WhatId,new list<task>{t});
        }
        
    }
    
    System.debug('Map  '+tasks);
    Map<Id,Opportunity> old_opp = Trigger.oldMap;

    for( Opportunity o : Trigger.new ){
        Opportunity old = old_opp.get(o.id);
         if (old.StageName != 'Closed Won' && old.StageName != 'Closed Lost' )
         {  

            if ( tasks.containskey(o.Id) ){
            
                System.debug('All Task '+tasks.get(o.id));    
                   list<task> tn = tasks.get(o.id);
   
                   for ( task st : tn ){
                    System.debug(' Task '+st);    
                       if ( st.Status != 'Completed' ){
                        System.debug('Task not completed '+st);  
                            if ( old.StageName != o.StageName )
                                   o.adderror(' You can\'t update Stage as task is pending');
                       }
                       
                   }
                
                
            }
           
   
         }
 }

    
}
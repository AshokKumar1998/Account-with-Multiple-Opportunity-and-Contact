trigger ass_4_9 on Opportunity (before insert) {

    list<Opportunity> aa = [ select name  from Opportunity where CreatedById =:UserInfo.getUserId() and IsClosed = false ];
   
    for ( Opportunity o : Trigger.new ){
        
            if ( aa.size() >=2 )
                o.adderror(' You can\'t create more then 2 open Opportunity');
          
    }
    
}
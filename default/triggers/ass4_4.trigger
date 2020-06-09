trigger ass4_4 on Opportunity (before delete) {

    for ( Opportunity o : Trigger.old ){
        
        if (o.StageName == 'Closed Won' || o.StageName == 'Closed Lost' ){
            
        }else{
            o.stagename.adderror(' You can\'t delete Open Opportunity');
        }
        
    }
    
}
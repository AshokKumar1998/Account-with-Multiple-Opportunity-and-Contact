trigger ass_4_10 on OpportunityLineItem (before insert) {

    Map<Id,Product2> record = new Map<Id,Product2>();
    list<Product2> pro =  [ select Description from Product2];
    for ( Product2 p : pro ){
        record.put(p.id,p);
    }

    for ( OpportunityLineItem oli : Trigger.new ){
        
        if (oli.UnitPrice < 1000){
             oli.adderror(' You can\'t create more then 2 Opportunity');
        }else{
            
            id i = oli.Product2Id;
            Product2 p = record.get(i);
            oli.Description = p.Description;
        }
        
    }
    
}
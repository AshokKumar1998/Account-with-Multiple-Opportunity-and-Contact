trigger ass_4_7 on Opportunity (before update) {

        List<Opportunity> back = new List<Opportunity>();
       
        for(Opportunity opp :  Trigger.old){
                Opportunity o = opp.clone();
                o.Name = opp.Name+' backup';
                back.add(o);
        }
        System.debug('Back  '+back);
        insert back;
    
}
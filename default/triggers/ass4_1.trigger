trigger ass4_1 on Account (after insert, before update) {
        
        list<Opportunity> opp = new list<Opportunity>();
    
        for(Account a: Trigger.new) {

            IF ( a.opportunities.size() == 0 ){
                opp.add(new Opportunity(name = 'First Opportunity '+a.Name, StageName = 'Closed lost', closedate =  Date.newInstance(2021, 01, 01), accountid =a.id));
            }
        
        }
    
    insert opp;

}
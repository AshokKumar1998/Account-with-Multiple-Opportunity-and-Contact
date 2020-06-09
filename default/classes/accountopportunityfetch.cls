public class accountopportunityfetch {

    @AuraEnabled(Cacheable=true)
    public static List<Account> search() {
	return [SELECT Id,Industry, Name ,Type,(SELECT id, Name FROM contacts) FROM Account LIMIT 10];        
    }


    
    static Map<String, list<Ashoka__Vender__c>> data = new Map<String, list<Ashoka__Vender__c>>();
    static list<Opportunity> junc ;
    
    
    @AuraEnabled(Cacheable=true)
    public static List < String > getselectOptions() {
        
        List < String > allOpts = new list < String > ();
        Schema.sObjectType objType = Opportunity.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        list < Schema.PicklistEntry > values =
            fieldMap.get('StageName').getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());                
        }
       
        system.debug('allOpts ---->' + allOpts);
        return allOpts;
    }
    
    
    
    @AuraEnabled(Cacheable=true)
    public static  String get_all_records( String recordId) {
        
        List < String > allOpts = new list < String >{'Prospecting', 'Qualification', 'Needs Analysis', 'Value Proposition', 'Id. Decision Makers', 'Perception Analysis', 'Proposal/Price Quote', 'Negotiation/Review', 'Closed Won', 'Closed Lost'};
            
            map<String, list<Opportunity>> data = new map<String, list<Opportunity>>();
        Id myIdp = Id.valueOf(recordId);
        
        for ( String str : allOpts ){
            data.put(str,[ select Name,AccountId,StageName from Opportunity where AccountId=:myIdp and StageName = :str  ]);    
        }
        
        map<String, list<Opportunity>> data2 = new map<String, list<Opportunity>>();
        
        for ( String str : allOpts ){
            data2.put(str,[ select Name,AccountId,StageName from Opportunity where StageName = :str ]);
        }
        
        map<String, map<string, list<SObject>>> main_data = new map<String, map<string, list<SObject>>>();
        main_data.put('selected',data);
        main_data.put('unselected',data2);
        
        string jsonstring =  JSON.serialize(main_data);
        System.debug(jsonstring);
        return jsonstring;
        
    }
    
    
    
    @AuraEnabled(Cacheable=true)
    public static  list<Opportunity> getOpportunities(String recordId) {
        
        Id myIdp = Id.valueOf(recordId);
        junc = [ select Name, CloseDate, Amount, LeadSource, Probability, StageName from Opportunity where AccountId =:myIdp ];
        return junc;
    }
    
    @AuraEnabled
    public static  String getchange( String  tochange,String recordId ) {
        
        Id myIdp = Id.valueOf(recordId);
       // System.debug('new updating data  '+tochange+'   id : '+myIdp);
        list<String> new_ids = tochange.split(',');

        list<Opportunity> opp = [ select name, accountid from Opportunity where accountid = :myIdp ];
        for ( Opportunity o : opp ){
            o.AccountId = null;
        }
        
        Database.update(opp,false);



        opp = [ select name, accountid from Opportunity where id in :new_ids ];
        System.debug('opps : '+opp);
        for ( Opportunity o : opp ){
            o.AccountId = myIdp;
        }
        
        Database.update(opp,false);
        System.debug('opps : '+opp);
        return 'Done';
        }



}
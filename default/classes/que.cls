public class que {

    public static void q(){
        
        Map<String, list<integer>> m = new map<String, list<integer>>();
        
        	Schema.DescribeFieldResult fieldResult = temp__c.Picklist__c.getDescribe();
        
	        List<String> options = new List<string>();
        
            List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
	        for( Schema.PicklistEntry pickListVal : ple){
                m.put(String.valueof(pickListVal.getLabel()), new list<Integer>());
                  options.add(String.valueof(pickListVal.getLabel()));
	        } 
        list<temp__c> val = [ select  Picklist__c,value__c from temp__c ];
        for(temp__c t : val ){
            list<integer> v = m.get(t.Picklist__c);
            v.add(integer.ValueOf(t.value__c));
            m.put(t.Picklist__c,v);
        }
        
        
        for(String s: options){
            list<integer> v = m.get(s);
            if(v.size()> 0)
            System.debug('Key - '+s+' => '+m.get(s));
        }
    }
    
}
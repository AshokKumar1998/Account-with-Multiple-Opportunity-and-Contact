public class acc_help {

    public static map<id,Integer> get_barnch_count(){
        
        map<id,Integer> accounts = new map<id,Integer>();
        
        list<Acc__c> acc = [ select Select_Branch__c from Acc__c ];
        
        for( Acc__c o: acc ) {
            
            if ( accounts.containsKey(o.Select_Branch__c) ) {
                Integer i = accounts.get(o.Select_Branch__c);
                i++;
                accounts.put(o.Select_Branch__c,i);
            }else{
            	accounts.put(o.Select_Branch__c,1);    
            } 
        
        }
       
        System.debug('returning  '+accounts);
        return accounts;
    }
    
    
    public static map<id,list<Acc__c>> get_barnch_record(){
        
        map<id,list<Acc__c>> accounts = new map<id,list<Acc__c>>();
        
        list<Acc__c> acc = [ select Select_Branch__c from Acc__c ];
        
        for( Acc__c o: acc ) {
            
            if ( accounts.containsKey(o.Select_Branch__c) ) {
                
                list<Acc__c> a = accounts.get(o.Select_Branch__c);
                a.add(o);
                accounts.put(o.Select_Branch__c,a);    
                    
            }else{
                list<Acc__c> a = new list<Acc__c>();
                a.add(o);
            	accounts.put(o.Select_Branch__c,a);    
            } 
        
        }
       
        System.debug('returning  '+accounts);
        return accounts;
    }
    
    public static void increaser(list<Acc__c> acc){
        Integer i=1;
        list<Acc__c> aa = new list<Acc__c>();
        
        for ( Acc__c a : acc ){
            
            a.sequencer__c = i++;
            aa.add(a);
            
        }
        System.debug('up list  '+aa);
        update aa;
        
    }
    
}
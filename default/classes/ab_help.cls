public class ab_help {
    
    public static map < String, obj_A__c> get_map(){
        
    	map < String, obj_A__c> rec = new map < String, obj_A__c>();
        list<obj_A__c> r = [ select id, name, Value_B__c, No_of_Dance__c, No_of_Eat__c, No_of_Walk__c from obj_A__c];
      
        System.debug('r '+r);
        for ( obj_A__c a : r ){
          
            String s = a.Name+' '+a.Value_B__c;
            rec.put(s,a);
            
        }
    	
        return rec;
    }

    public static map < id, obj_A__c> get_rec(){
        
    	map < id, obj_A__c> rec = new map < id, obj_A__c>();
        list<obj_A__c> r = [ select id, name, Value_B__c, No_of_Dance__c, No_of_Eat__c, No_of_Walk__c from obj_A__c ];
      
        for ( obj_A__c a : r ){
          
            rec.put(a.id,a);
            
        }
    	
        return rec;
    }

}
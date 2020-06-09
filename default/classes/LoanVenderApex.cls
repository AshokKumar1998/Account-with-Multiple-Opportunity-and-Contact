public class LoanVenderApex {
    
    static List < String > allOpts = new list < String > ();
    static Map<String, list<Ashoka__Vender__c>> data = new Map<String, list<Ashoka__Vender__c>>();
    static list<Ashoka__LoanVender__c> junc ;
    
    
    @AuraEnabled
    public static List < String > getselectOptions() {
        
        
        Schema.sObjectType objType = Ashoka__Vender__c.getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        list < Schema.PicklistEntry > values =
            fieldMap.get('Ashoka__VenderType__c').getDescribe().getPickListValues();
        
        for (Schema.PicklistEntry a: values) {
            allOpts.add(a.getValue());                
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        
        return allOpts;
    }
    
    
    
    @AuraEnabled
    public static  String get_all_records( String parent) {
        
        List < String > allOpts = new list < String >{'Bike','Bus','Car','Train','Truck'};
            
            map<String, list<Ashoka__LoanVender__c>> data = new map<String, list<Ashoka__LoanVender__c>>();
        Id myIdp = Id.valueOf(parent);
        
        for ( String str : allOpts ){
            data.put(str,[ select Ashoka__Vender__r.Name,Ashoka__Vender__c from Ashoka__LoanVender__c where Ashoka__Loans__c=:myIdp and Ashoka__Vender__r.Ashoka__VenderType__c = :str  ]);    
        }
        
        map<String, list<Ashoka__Vender__c>> data2 = new map<String, list<Ashoka__Vender__c>>();
        
        for ( String str : allOpts ){
            data2.put(str,[ select Name, Ashoka__VenderType__c from Ashoka__Vender__c where Ashoka__VenderType__c = :str ]);
        }
        
        map<String, map<string, list<SObject>>> main_data = new map<String, map<string, list<SObject>>>();
        main_data.put('selected',data);
        main_data.put('unselected',data2);
        
        string jsonstring =  JSON.serialize(main_data);
        return jsonstring;
        
    }
    
    
    
    @AuraEnabled
    public static  list<Ashoka__LoanVender__c> getchildrecords(String parent) {
        
        Id myIdp = Id.valueOf(parent);
        junc = [ select Name, Ashoka__Loans__r.Name, Ashoka__Vender__r.Name, Ashoka__Vender__r.Ashoka__VenderType__c , Ashoka__Vender__r.Ashoka__Comapny_Name__c from Ashoka__LoanVender__c where Ashoka__Loans__c=:myIdp ];
        return junc;
    }
    
    @AuraEnabled
    public static  String getchange( Map<String, Object>  selected,String parent ) {
        
        Id myIdp = Id.valueOf(parent);
        System.debug('new updating data  '+selected);
        
           for ( String typ : selected.keyset() ){
                
                list<String> ids = selected.get(typ).toString().split(',');
               
                System.debug('new updating ids  '+typ+'   '+ids+'   size  '+ids.size());
               
        		if ( ids.size() > 0){
           
              
                
                list<Ashoka__LoanVender__c> prev = [ select Ashoka__Vender__c from Ashoka__LoanVender__c where Ashoka__Loans__c=:myIdp and Ashoka__Vender__r.Ashoka__VenderType__c = :typ  ];
                list<Ashoka__LoanVender__c> prev_del = new list<Ashoka__LoanVender__c> (); 
                for ( Ashoka__LoanVender__c lv : prev ){
                    
                    if (! ids.contains( String.valueOf( lv.Ashoka__Vender__c ) ) ){
                        prev_del.add(lv);
                    }else{
                        ids.remove( ids.indexOf( String.valueOf( lv.Ashoka__Vender__c ) ) );
                    }
                    
                }
                System.debug('All Prev '+prev);
                System.debug('To delete '+prev_del);
                delete prev_del;
                System.debug('ids  '+ids);
            
                
                
                
                
                list<Ashoka__LoanVender__c> junc = new list<Ashoka__LoanVender__c>();
               System.debug('new insert updating ids  '+typ+'   '+ids+'   size  '+ids.size());
                    if ( ids.size() > 0 && ids[0] != '')
                for( id a : ids ){
                    Id myIdc = Id.valueOf(a);
                    junc.add( new Ashoka__LoanVender__c(Ashoka__Loans__c = myIdp, Ashoka__Vender__c = myIdc));
                }
                
                
                
                insert junc;
            
            }else{
                list<Ashoka__LoanVender__c> prev = [ select Ashoka__Vender__c from Ashoka__LoanVender__c where Ashoka__Loans__c=:myIdp  ];
                delete prev;
            }
         }
            return 'Done';
        }
        
    }
public class insert_custom_relation_account {
    
    @AuraEnabled
    public static List < Ashoka__Branch__c > fetchLookUpValues(String searchKeyWord) {
        
        String searchKey = searchKeyWord + '%';
        
        List < Ashoka__Branch__c > returnList = new List < Ashoka__Branch__c > ();
        
        String sQuery =  'select id, Name from Ashoka__Branch__c where Name LIKE: searchKey order by createdDate DESC limit 5';
        List < Ashoka__Branch__c > lstOfRecords = Database.query(sQuery);
        
        for (Ashoka__Branch__c obj: lstOfRecords) {
            returnList.add(obj);
        }
        return returnList;
    }
    
    @AuraEnabled
    public static String insert_account(Ashoka__Acc__c a) {
        String mess = '';
        try{
            
            System.debug('acc id'+a.Ashoka__Select_Branch__c);
            String s = a.Ashoka__Select_Branch__c;
            Ashoka__Branch__c sb = [ select id,name from Ashoka__Branch__c where name = :s limit 1 ];
            a.Ashoka__Select_Branch__c = sb.id;
            System.debug('acc '+a);
            
            insert a;
            mess = a.id+'';
        }catch( Exception e ){
            
            mess = e.getMessage();
            
        }
        
        
        return mess;
    }
    
    @AuraEnabled
    public static  List < String > getpickval() {
        
        String objectName = 'Ashoka__Acc__c';
        String fieldName =  'Ashoka__Account_Type__c';
        
        
        List<String> lstPickvals=new List<String>();
        Schema.SObjectType targetType = Schema.getGlobalDescribe().get(objectName);//From the Object Api name retrieving the SObject
        Sobject Object_name = targetType.newSObject();
        Schema.sObjectType sobject_type = Object_name.getSObjectType(); //grab the sobject that was passed
        Schema.DescribeSObjectResult sobject_describe = sobject_type.getDescribe(); //describe the sobject
        Map<String, Schema.SObjectField> field_map = sobject_describe.fields.getMap(); //get a map of fields for the passed sobject
        List<Schema.PicklistEntry> pick_list_values = field_map.get(fieldName).getDescribe().getPickListValues(); //grab the list of picklist values for the passed field on the sobject
        for (Schema.PicklistEntry a : pick_list_values) { //for all values in the picklist list
            lstPickvals.add(a.getValue());//add the value  to our final list
        }
        
        System.debug(' list  '+lstPickvals);
        return lstPickvals;
    }
    
    
}
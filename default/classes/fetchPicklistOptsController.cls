public class fetchPicklistOptsController {
    
    @AuraEnabled
    public static List < String > getobjectOptions() {
        
        List < String > allOpts = new list < String > ();
        
        Map<String, Schema.SObjectType> fieldMap = Schema.getGlobalDescribe();
        
        for(Schema.SObjectType thisObj : fieldMap.values()) {
            System.debug(thisObj);
            allOpts.add(thisObj+'');
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
    
     @AuraEnabled
    public static String execute( String query) {// public static List < SObject > execute( String query) {
        
        System.debug('query  '+query);
        List < SObject > allOpts = Database.query(query);
        System.debug('query data '+allOpts);
        string jsonstring =  JSON.serialize(allOpts);
        return jsonstring.toLowercase();
    }
    
    @AuraEnabled
    public static List < String > getobjectfield(String objObject) {
        
        Schema.SObjectType obj = Schema.getGlobalDescribe().get(objObject);
        
        List < String > allOpts = new list < String > ();
        
        Schema.sObjectType objType = obj.newSObject().getSObjectType();
        Schema.DescribeSObjectResult objDescribe = objType.getDescribe();
        map < String, Schema.SObjectField > fieldMap = objDescribe.fields.getMap();
        
        
        for ( String a: fieldMap.keySet()) {
            allOpts.add(a);
        }
        system.debug('allOpts ---->' + allOpts);
        allOpts.sort();
        return allOpts;
    }
    
    @AuraEnabled
    public static  String getfieldtype(String objObject, String field) {
        
        String objectName = objObject;
        String fieldName =  field;
        
        Schema.DisplayType f = Schema.getGlobalDescribe() // or Schema.SOAPType
            .get(objectName)
            .getDescribe()
            .fields
            .getMap()
            .get(fieldName)
            .getDescribe()
            .getType(); // or getSOAPType()
        System.debug(f);
        
        return f+'';
    }
    
    @AuraEnabled
    public static  List < String > getpickval(String objObject, String field) {
        
        String objectName = objObject;
        String fieldName =  field;
        
        
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
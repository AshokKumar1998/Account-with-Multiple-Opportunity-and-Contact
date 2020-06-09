public with sharing class ContactHelper {
  
    @AuraEnabled
    public static List<Contact> getContacts(){
        return [ SELECT Name, phone FROM Contact limit 25 ];
    }

    @AuraEnabled
    public static List<Contact> getContact_name(String nam){
        nam = '%'+nam+'%';
        return [ SELECT Name, phone FROM Contact where name like :nam ];
    }

    @AuraEnabled
    public static Contact getContact_id(ID i){
        
        Contact c = [ SELECT Name, phone FROM Contact where id = :i ];
        System.debug('contact '+c);
        return c;
    }
    

}
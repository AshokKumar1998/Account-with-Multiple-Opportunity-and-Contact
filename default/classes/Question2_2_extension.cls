public class Question2_2_extension {

    public Id i{get;set;}

    public List<Contact> con{get;set;}
    public List<Properties__c> prop{get;set;}


    public Question2_2_extension() {
        System.debug('id  '+ApexPages.currentPage().getParameters().get('id'));
        Properties__c p = [ select account__c from Properties__c where Id =:ApexPages.currentPage().getParameters().get('id') ];
        con = [ select firstname, lastname, phone from Contact where accountid =:p.account__c ];
        prop = [ SELECT Account__c, Name FROM Properties__c where id= :ApexPages.currentPage().getParameters().get('id') ];

    }

   
}
public with sharing class Question2_extension {

    public Id i{get;set;}

    public List<Contact> con{get;set;}
    public List<Properties__c> prop{get;set;}


    public Question2_extension() {

    }

    public Question2_extension(Apexpages.StandardController cont) {

        Contact c = [ select accountid from contact where Id =:cont.getId() ];
        con = [ select firstname, lastname, phone from Contact where Id =:cont.getId() ];
        prop = [ SELECT Account__c, Name FROM Properties__c where Account__c= :c.accountid ];

        this.i = cont.getId();

    }
}
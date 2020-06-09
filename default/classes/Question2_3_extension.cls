public with sharing class Question2_3_extension {

    public String pname{get;set;}

    public Question2_3_extension() {

    }

    public List<Properties__c> prop{get;set;}

    Public id selectedname{get;set;}

    Public List<SelectOption> getselectedaccnamefields(){
        List<Selectoption> values = new List<Selectoption>();
        values.add(new SelectOption('','--None--'));
        List<Account> acc = [Select name,id from Account];
        for ( Account a : acc ){
            values.add(new SelectOption(a.Id,a.Name));
        }
        return values; 
    }


    public void getrec(){

        prop = [ SELECT Account__c, Name FROM Properties__c ];

    }

    public void getcreate(){
        System.debug('name  '+pname+'   id'+selectedname);
        Properties__c p = new Properties__c(name = pname, account__c = selectedname );
        System.debug('New PRoperty  '+p);
        

        insert p;

         
    }
}
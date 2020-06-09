public with sharing class Question3 {


    public Question3(Apexpages.StandardController cont) {

        selectedname = cont.getId();
        getrec();

    }

    public List<OpportunityLineItem> prop = new  List<OpportunityLineItem>();
    public set<OpportunityLineItem> prop2 = new set<OpportunityLineItem>();
    List<String> names = new List<String>();
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

    public void setprop( List<OpportunityLineItem> prop ){
        this.prop = prop;
    }

    public List<OpportunityLineItem> getprop(){
        return prop;
    }


    public void getrec(){

        list<Opportunity> opp = [ select id from Opportunity where accountid =:selectedname];

        for( Opportunity o : opp ){

            prop2.addall([ SELECT Product2Id, Quantity, Description, Discount, TotalPrice FROM OpportunityLineItem where OpportunityId = : o.Id ]);

        }

        for ( OpportunityLineItem oli : prop2 ){
            if ( names.contains(oli.Product2Id) ){

            }else{
                names.add(oli.Product2Id);
                prop.add(oli);
            }
            
        }
    }

}
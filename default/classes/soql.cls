public class soql {

    public static void m1(){
        string name = 'K%';
        list<Loan_Detail__c> acc = [  select Account_Num__r.Select_Branch__r.name,  Account_Num__r.Name,  Account_Num__r.Account_Holder_Nme__c,  Loan_type__c  from Loan_Detail__c  ];
        
    //    list<Branch__c> acc4 = [  select Bank_Name__r.name, name,  (select Account_Holder_Nme__c  from Acc_s__r ) , (select Loan_type__c from Detail_s__r) from Branch__c  ];
        
        list<Acc__c> acc3 = [  select Name,  Account_Holder_Nme__c,  (select Loan_type__c from Detail_s__r)  from  Acc__c ];
        
        list<Acc__c> acc5 = [  select Name,  Account_Holder_Nme__c,  (select Loan_type__c from Detail_s__r), (select Transection_type__c,Amount__c from Transections__r)  from  Acc__c ];
        
        
     	list<AggregateResult> acc2 = [select Account_Type__c, count(Account_Holder_Nme__c) from Acc__c group by Account_Type__c];
        
        System.debug(acc2);
        
        for (Loan_Detail__c a: acc){
           // System.debug('Account No : '+ a.name+'   type : '+Account_Type__c+ '  Balance  : '+Current_Account_Balance__c);
            System.debug(a);
        }
    }
    
    
     public static void m2(){
        
         string  query = 'select Account_Num__r.Select_Branch__r.name';
         
         list<string> field_name = new list<string>{'Account_Num__r.Account_Holder_Nme__c','Account_Num__r.Name','Loan_type__c'};
         
             for(String s: field_name){
                 query+= ', '+s;
             }
             
         string object_name='Loan_Detail__c';
         
         query+=' from '+object_name;
         
         query = string.escapeSingleQuotes(query);
         
         System.debug('query : '+query);
         
         list<Loan_Detail__c> acc = Database.query(query);
        
        System.debug(acc);
         
    }
    
    
}
trigger ass4_3 on Account (after delete ) {

    list<Account_backup__c> acc_4_back = new list<Account_backup__c>();
    
    for ( Account a : trigger.old ){
        
        if(a.MasterRecordId != null)
        acc_4_back.add( new Account_backup__c(Account_Num__c = a.Name, phone__c = a.phone) );
       
    }
   
    if (acc_4_back.size() != 0)
        insert acc_4_back;
    
}
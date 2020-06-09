trigger daily_limit on Transection__c (before insert) {
    
    list<Acc__c> acc = new list<Acc__c>();
    
    map<id,Acc__c> detail = new map<id,Acc__c>();
    
    for ( Transection__c s : Trigger.new ){
        detail.put(s.Account_Num__c, null);
    }
    
    detail.putAll([select Limit_deposite__c,limit_with__c from Acc__c where id in :detail.keySet()]);
    
    for ( Transection__c s : Trigger.new ){
        
        if ( s.Transection_type__c == 'Deposit' ){
            
            Acc__c aa = detail.get(s.Account_Num__c);
            System.debug('account deposite : '+aa.Limit_deposite__c);
            if ( aa.Limit_deposite__c < 3 ){
                aa.Limit_deposite__c += 1;
                acc.add(aa);   
            }else{
                s.adderror('Can\'t deposite more then 3 times in a day' );
            }
            
        }else{
            
            Acc__c aa = detail.get(s.Account_Num__c);
            System.debug('account deposite : '+aa);
            if ( aa.limit_with__c < 3 ){
                aa.limit_with__c += 1;
                acc.add(aa);   
            }else{
                s.adderror('Can\'t Withdrawal more then 3 times in a day' );
            }
            
        }
        
    }
    update acc;

}
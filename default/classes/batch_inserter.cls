global class batch_inserter implements Database.Batchable<Sobject> {

    public list<temp__c> tt = new list<temp__c>();
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        
      System.debug('Batch Go');
        
        return Database.getQueryLocator([ select name from temp__c ]);
    }
    
    global void execute (Database.BatchableContext bc, list<sobject> l){
       
        for (Integer i=1; i<=1000; i++){
            tt.add(new temp__c(Picklist__c = 'A', value__c = i));
        }
        System.debug(tt);
        
    }
    
    global void finish(Database.BatchableContext bc){
        
        insert tt;
    	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        list<String> add = new list<String>{'ashokkumargoliya100@gmail.com'};
        mail.setToAddresses(add);
        mail.setPlainTextBody('param1 go');
        Messaging.sendEmail( new Messaging.SingleEmailMessage[]{mail} );
        
    }
    
    
}
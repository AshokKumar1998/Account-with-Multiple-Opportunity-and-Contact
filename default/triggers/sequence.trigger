trigger sequence on Acc__c (before insert, after update, after delete) {
        if ( trigger.isbefore ){
        
        
            if ( Trigger.isinsert){
        
                        map<id,Integer> total_acc = acc_help.get_barnch_count();
                        System.debug('total '+total_acc);
                        
                        
                        for ( Acc__c a : Trigger.new ){
        
                            
                            Integer before = 0;
                            
                            if( total_acc.containsKey(a.Select_Branch__c) ){
                                 before = total_acc.get(a.Select_Branch__c); 
                            }else{
                                before = 0;
                            }
                            
                            a.sequencer__c = before+1;
                            System.debug('an  '+a);
                            
                            
                        }
                        
                
                    }

        }else{
            
            if ( Trigger.isdelete ){
                
                map<id,list<Acc__c>> total_acc = acc_help.get_barnch_record();
             
                list<Acc__c> new_acc = new list<Acc__c>();
                
                for ( Acc__c i : Trigger.old ){
                    
                    acc_help.increaser( total_acc.get(i.Select_Branch__c) );
                    
                }
                
            }
            
        }
    
    
}
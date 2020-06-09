@isTest
public class ab_help_test {

    public Static testmethod void testController(){
        Test.startTest();
        
        obj_B__c b = new obj_B__c(name='Yoho', Value_B__c='ohoY', pick__c = 'Dance');
        obj_B__c c = new obj_B__c(name='Yoho1', Value_B__c='ohoY1', pick__c = 'Eat');
        obj_B__c d = new obj_B__c(name='Yoho2', Value_B__c='ohoY2', pick__c = 'Walk');
        insert b;
         insert c;
         insert d;
        
       map < String, obj_A__c> rec = ab_help.get_map();
       map < id, obj_A__c> rec2 = ab_help.get_rec();
        
        b.Name = 'Dada';
        c.Name = 'Dada1';
        d.Name = 'Dada2';
        
        update b;
        update c;
        update d;
        
        b.pick__c = 'Eat';
        c.pick__c = 'walk';
        d.pick__c = 'Dance';
        
         update b;
        update c;
        update d;
        
         b.Value_B__c = 'Dada';
        c.Value_B__c = 'Dada1';
        d.Value_B__c = 'Dada2';
        
         update b;
        update c;
        update d;
        
        delete b;
        delete c;
        delete d;
      
        Test.stopTest();
    }
    
}
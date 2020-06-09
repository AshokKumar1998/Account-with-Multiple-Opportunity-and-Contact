@isTest
public class Tester {

    public Static testmethod void my(){
        Test.startTest();
        
        obj_B__c b = new obj_B__c(name='Yoho', Value_B__c='ohoY', pick__c = 'Dance');
        insert b;
        
       map < String, obj_A__c> rec = ab_help.get_map();
       map < id, obj_A__c> rec2 = ab_help.get_rec();
        
      /*  ass2.q1();
        ass2.q2(Date.newInstance(2010, 01, 01), Date.newInstance(2021, 01, 01));
        ass2.q3();
        ass2.q4();
        ass2.q5();
        ass2.q6();
        ass2.q6a('Programming',5000,50000);
        */
        Test.stopTest();
    }
    
  /*  Static testmethod void my2(){
      //  Test.startTest();
        
        ass3.q1();
        ass3.q2();
        ass3.q3_insert();
        ass3.q3_delete();
        ass3.q4();
        ass3.q5_A();
        ass3.q5_B();
        ass3.q6();
        ass3.q7();
        ass3.q8();
        ass3.q9('Account');
        ass3.q10();
        
      //  Test.stopTest();
    }
    */
}
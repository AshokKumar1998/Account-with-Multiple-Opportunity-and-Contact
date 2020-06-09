@isTest
public class trig_4_1_test {

    
     public Static testmethod void test1(){
        Test.startTest();
         
         Account a  = new Account(name = 'First Test Account');
         insert a;
         
        Test.stopTest();
    }
    
    /* public Static testmethod void test2(){
        Test.startTest();
         
         Account a  = new Account(name = 'First Test Account');
         insert a;
         Opportunity o = new Opportunity(name = 'Opportunity' , accountid = a.id, StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
         Opportunity o2 = new Opportunity(name = 'Opportunity' , accountid = a.id, StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o2;
        Test.stopTest();
    }*/
    
    /*public Static testmethod void test3(){
        Test.startTest();
         
         Account a  = new Account(name = 'First Test Account');
         insert a;
         Account aa  = new Account(name = 'First Test Account');
         insert aa;
        
        list<Account> acc = [select name from Account];
       
        Account a1  = acc[0], a2 = acc[1];        
        
        merge a1 a2;
        
        Test.stopTest();
    }
    */
    
   /*  public Static testmethod void test4(){
        Test.startTest();
         
         Opportunity o = new Opportunity(name = 'Opportunity' , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
         delete o;
        Test.stopTest();

     }*/
    
     /* public Static testmethod void test4_new(){
        Test.startTest();
         Account a  = new Account(name = 'First Test Account');
         insert a;
         Opportunity o = new Opportunity(name = 'Opportunity' , accountid = a.id, StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
         Opportunity o2 = new Opportunity(name = 'Opportunity' , accountid = a.id, StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o2;
         Opportunity o3 = new Opportunity(name = 'Opportunity', accountid = a.id , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o3;
         delete a;
        Test.stopTest();

     }*/
    
     /*  public Static testmethod void test6(){
        Test.startTest();
         Account a  = new Account(name = 'First Test Account');
         insert a;
         Opportunity o = new Opportunity(name = 'Opportunity' ,amount = 12000, accountid = a.id, StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
         
        Test.stopTest();

     }*/
    
     /*public Static testmethod void test7(){
        Test.startTest();
         lead a  = new lead(lastname = 'First Test Account', leadsource = 'Phone Inquiry', company='xyz', status = 'Open - Not Contacted');
         insert a;
        Test.stopTest();

     }*/
    
    /* public Static testmethod void test8(){
        Test.startTest();
         Opportunity o = new Opportunity(name = 'Opportunity' , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
         o.name = 'updating';
         update o;
        Test.stopTest();
     }*/
    
     /*public Static testmethod void test9(){
        Test.startTest();
        
         Opportunity o = new Opportunity(name = 'Opportunity' , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
          Opportunity o4 = new Opportunity(name = 'Opportunity', StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o4;
         Opportunity o2 = new Opportunity(name = 'Opportunity' , StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
         insert o2;
         Opportunity o3 = new Opportunity(name = 'Opportunity' , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o3;
        
        Test.stopTest();
     }*/
    
     /* public Static testmethod void test10(){
        Test.startTest();
        
         Opportunity o = new Opportunity(name = 'Opportunity' , StageName = 'Qualification', closedate =  Date.newInstance(2021, 01, 01));
         insert o;
          Product2 prod = new Product2(
    	 Name = 'Product X',
    	 ProductCode = 'Pro-X',
     	isActive = true
		);
		insert prod;

	 	PricebookEntry pbEntry = new PricebookEntry(
     	Pricebook2Id = '01s2w000003T1J4AAK',
     	Product2Id = prod.Id,
     	UnitPrice = 100.00,
     	IsActive = true
		);
		insert pbEntry;

        OpportunityLineItem olii = new OpportunityLineItem (Quantity=2, OpportunityId=o.Id, TotalPrice=10, PriceBookEntryId=pbEntry.id); 
		insert olii; 
        
        Test.stopTest();
     }*/
    
}
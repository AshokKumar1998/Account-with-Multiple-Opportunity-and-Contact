public class ass3 {
    
    
    
public static void q1(){
        
        list<Student__c> std_list = [ select name,Student_Name__c from Student__c where Student_Name__c like :'S%' ];
        Integer num=1;
        for( Student__c s : std_list ){
            
            s.Student_Name__c = s.Student_Name__c+' Test '+num++;
            
        }
        
        Database.update(std_list,false);
        
    }
    
    
    
public static void q2(){
        
   try{
        list<Account> acc_list = [ select name, (select name from Opportunities) from Account ];
        list<Opportunity> opp_list = new list<Opportunity>();
       list<Opportunity> temp_opp = new list<Opportunity>();
        
        for ( Account a : acc_list ){
          
            temp_opp = a.Opportunities;
            if( temp_opp.size() == 0 ){																							//a.Opportunities == null
                //System.debug('account '+a.id+' do not have opportunity');
                Opportunity o = new Opportunity(name = a.Name+' First Opportunity' , accountid = a.Id, StageName = 'Closed Won', closedate =  Date.newInstance(2021, 01, 01));
                opp_list.add(o);
            }
            
        }
       // System.debug('new opp list : '+opp_list);
        Database.insert(opp_list);
   
   }   
        catch(Exception e){
            System.debug('Error : '+e.getMessage());
        }    
    }
    
    
public static void q3_insert(){
        
    try{
     
        list<Contact> con = new list<Contact>();
        list<Account> acc = new list<Account>();
        
        
        for (Integer i=1; i<5; i++){
            
          
            Contact c = new Contact(lastname = 'Temp '+i);
            Account accountReference = new Account( MyExtID_c__c='SAP1111'+i); 
            c.Account = accountReference;
            Account a = new Account(name= 'Temp '+i,MyExtID_c__c='SAP1111'+i,email__c = 'asd'+i+'@'+i+'asd.c');
            acc.add(a);
            con.add(c);
        }
        
        list<list<SObject>> lis = new list<list<SObject>>{acc,con};
        database.insert(lis[0]);	 database.insert(lis[1]);
    }
    catch(Exception e){
            System.debug('Error : '+e.getMessage());
    }
    }
  
    
public static void q3_delete(){
        
    try{
        list<Account> acc = [select name from Account where name like :'Temp%'];
        list<Contact> con = [select lastname from Contact where lastname like :'Temp%'];
        
        delete acc;
        delete con;
        
    }
    catch(Exception e){
            System.debug('Error : '+e.getMessage());
    }
    }
    
    
public static void q4(){
        
       try{
           
            list<Account> acc = [ select name, AccountNumber, Phone from Account ];
        	Integer i=101;
       		for ( Account a: acc ){
            
            a.AccountNumber = '12345'+i;
            a.Name = a.Name+i;
            a.Phone = '3456345636'+i;
            
        	}
        	Database.upsert(acc);
           
       }catch(Exception e){
           System.debug('Error : '+e.getMessage());
       }
        
    }
    
    
public static void q5_A(){
        
        list<Student__c> std_list = [ select Student_Name__c from Student__c where Student_Name__c like :'_R%' ];
        
        delete std_list;
        
        std_list = [ select id from Student__c where Student_Name__c like :'%r%' and isDeleted = true ALL ROWS];
        
        Database.emptyRecycleBin(std_list);
        
    }

    
public static void q5_B(){
        
        try{
            
            list<Student__c> std_list = [ select ID, Student_Name__c from Student__c where 
                                         LastModifiedDate >= :Date.newInstance(2018, 05, 01) and 
                                         LastModifiedDate <= :Date.today()+1 and
					                     LastModifiedById = '0052w000001msacAAA' and																			// :Date.newInstance(2018, 05, 30) and 
                                         isDeleted = true ALL ROWS
                                        ];
        																																						//list<Student__c> std_list = [ select id from Student__c where LastModifiedDate > :Date.newInstance(2018, 05, 01) and LastModifiedDate < :Date.newInstance(2018, 05, 30) and isDeleted = true ALL ROWS];
        	Database.undelete(std_list,false);
            
        }catch(Exception e){
           System.debug('Error : '+e.getMessage());
       }
        
    }
    
    
public static void q6(){
        try{
            
        	Contact c = new Contact (lastname = 'ashok question 6');
            Account accountReference = new Account( MyExtID_c__c='SAP111111');      
            c.Account = accountReference;
            Account a = new Account(name = 'ashok question 6', MyExtID_c__c='SAP111111', email__c = 'asd@asd.c');
        
		
	        Database.SaveResult[] results = Database.insert(new SObject[] {a, c });

	        
        }catch(Exception e){
           System.debug('Error : '+e.getMessage());
       }
        
    }
    
    
public static void q7(){
        
    try{
     	list<Account> acc = new list<Account>();
        list<Contact> con = new list<Contact>();
        list<OpportunityLineItem> opp_product = new list<OpportunityLineItem>();
        
        for (Integer i=1; i<=3; i++){
            
            Account a = new Account(name= 'Temp '+i, email__C = i+'@'+i+'.com');
            acc.add(a);

        }
        
        Database.SaveResult[] results = Database.insert(acc, false);
        
        
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

               
          for (Integer i = 0; i < results.size(); i++) {
	            if (results[i].isSuccess()) {

	            System.debug('Successfully created ID: '+ results[i].getId()+'     Email => '+ acc[i].email__c );
                    
                Contact c = new Contact(lastname = 'Temp '+i, accountid = results[i].getId());
            	con.add(c);    

                Opportunity o = new Opportunity(name = 'Q7 Opportunity '+i , accountid = results[i].getId(), StageName = 'Closed Lost', closedate =  Date.newInstance(2021, 01, 01));
                insert o;
                
                OpportunityLineItem op = new OpportunityLineItem(OpportunityId = o.Id, quantity = 100, totalprice = 15000, PricebookEntryId= pbEntry.Id);
                opp_product.add(op);
                 
	            } 
              else 
              {

	            System.debug('Error: could not create sobject ' + 'for array element ' + i + '.');
	            System.debug('The error reported was: '+ results[i].getErrors()[0].getMessage() + '\n');

	            }

	        }
        insert con;
        insert opp_product;
        
    }
    catch(Exception e){
            System.debug('Error : '+e.getMessage());
    }
}
   
    
public static void q8(){
        
        
   try{
        list<Account> acc_list = [ select id, (select name from Opportunities) from Account ];
        list<Opportunity> opp_list = new list<Opportunity>();
        list<Account> temp_acc = new list<Account>();
        
        for ( Account a : acc_list ){
          
            opp_list = a.Opportunities;
            if( opp_list.size() >= 2 ){
               temp_acc.add(a);
            }
            
        }
        System.debug(' list : '+temp_acc);
        Database.delete(temp_acc, false);
   
   	 }   
        catch(Exception e){
            System.debug('Error : '+e.getMessage());
        }    
    
        
    }
    
    
public static void q9(String obj){
        
        String query = 'select count() from '+obj;
        Integer count = Database.countQuery(query);
        System.debug('records are '+count);
        
    }
    
    
public static void q10(){
        
        try{
            
            Savepoint sp1 = Database.setSavepoint();
            
            list<Student__c> std = new list<Student__c>();
            for (Integer i=1; i<=100; i++){
                Student__c s = new Student__c(Student_Name__c = 'go '+i+' / 100', age__c = 65, Hobbies__c = 'google', email__c = i+'@'+i+'.com', X12th_Percent__c = i, Fees__c = 10000, Aadhar__c = '123458912'+i);
                std.add(s);
            }
            
            
            Database.SaveResult[] results = Database.insert(std,false);
        
          Integer record_fail = 0;    
          for (Integer i = 0; i < results.size(); i++) {
	            if (results[i].isSuccess()) {

	            System.debug('Successfully created ID: '+ results[i].getId());
                 
	            } 
              else 
              {

                record_fail++;
	            System.debug('Error: could not create sobject ' + 'for array element ' + i + '.');
	            System.debug('The error reported was: '+ results[i].getErrors()[0].getMessage() + '\n');

	            }

	        }
            if(record_fail >=20 ){
                Database.rollback(sp1);
            }
            
        }catch(Exception e){
            System.debug('Error '+e.getMessage());
        }
        
    }
    

}
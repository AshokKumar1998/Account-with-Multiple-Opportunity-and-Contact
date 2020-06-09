public class ass2 {

    
    public static void q1(){
        
  list<AggregateResult> result = [select FISCAL_YEAR(CloseDate), SUM(Amount) 
                                  from Opportunity 
                                  where StageName = :'Closed Won' 
                                  and OwnerId = :UserInfo.getUserId()  
                                  group by FISCAL_YEAR(CloseDate)
                                 ];
  
     System.debug('result : '+result);   
    }
    
    
    
    
    
    
    public static void q2( Date first_date, Date second_date ){
        
        
    //    Date first_date = Date.newInstance(2010, 01, 01);
    //    Date second_date = Date.newInstance(2021, 01, 01);
        
        
        list<Opportunity> result = [select name, amount, StageName 
                                    from Opportunity 
                                    where CloseDate>= :first_date 
                                    and CloseDate<= :second_date 
                                    and OwnerId = :'0052w000001msacAAA' //User  Saurman D\'souza   0052w000001msacAAA
                                   ];
        
        for (Opportunity o : result){
            System.debug(o);
        }
        
    }
    
    
    
    
    
    
    public static void q3(){
        
    list<Account> result_A = [ select name, 
                              				(select name, StageName from Opportunities), 
                              				(select name, MobilePhone from Contacts), 
                              				(select id, title from notes)  
                              from Account 
                              where name like :'B%' 
                             ];
        
	  for (Account a : result_A){
            System.debug('Result 3A Account => '+a);
          System.debug('Result 3A Opportunity => '+a.Opportunities);
        }
    
         
      list<Opportunity> result = [ select name, Account.Name,
                                  							(select  ContactId from OpportunityContactRoles), 
                                  							(select title from notes) 
                                  from Opportunity 
                                  where name like :'%a'
                                 ];
       
             
	  for (Opportunity a : result){
          
          System.debug('Result 3B => '+a);
          
        }
    
        
    }
    
    
    
    
    
    
    
    public static void q4(){
        
        
        list<list<SObject>> res =[ Find 'Test' 
                                   Returning Account
                                  					(name where OwnerId =:UserInfo.getUserId()), 
                                  			Opportunity
                                  					(name where CloseDate = THIS_FISCAL_YEAR)
                                 ];
        
        list<account> r1 = res.get(0);
        for(Account o : r1){
         System.debug('account : '+o);
        }
        list<Opportunity> r2 = res.get(1);
        for(Opportunity o : r2){
         System.debug(o.Name);
        }
        
  
        
    }
    
    
    
    
    
    
    public static void q5(){
        
         list<Account> result_A = [ select name, 
                                   				(select ID, name, StageName from Opportunities), 
                                   				(select ID, name, MobilePhone from Contacts), 
                                   				(select id, title from notes)  
                                   from Account 
                                  ];
    		
         Map<id, list<Note>> note_rec = new Map<id, list<Note>>();
         Map<id, list<Opportunity>> opp_rec = new Map<id, list<Opportunity>>();
         Map<id, list<Contact>> con_rec = new Map<id, list<Contact>>();
        
          for ( Account a : result_A){
           
            opp_rec.put(a.id, a.Opportunities);
            con_rec.put(a.id, a.Contacts);
            note_rec.put(a.id, a.Notes);
            
        }
        
        System.debug('Opportunity \n  '+opp_rec);
        System.debug('Contact \n  '+con_rec);
        System.debug('Note \n  '+note_rec);
        
    }
    
    
    
    
    
    
    
    public static void q6(){
        
        list<SObject> q1 = [ select Batch_of_student__r.name, count(Student_in_batch__r.name) 
                             from Student_in_batch__c
                             group by Batch_of_student__r.name 
                           ];
      //  System.debug('q1 =>  '+q1);
        
        
        
        list<AggregateResult> q2 = [ select Rating_for_Student__c, AVG(Rating_10__c) 
                                     from Rating__c 
                                     group by Rating_for_Student__c 
                                     order by AVG(Rating_10__c) 
                                   ];
         System.debug('q2 =>  '+q2);
        
        
        
        list<Student__c> q3 = [ select name, Student_Name__c from Student__c where Student_Name__c like :'%aa%' ];
      //  System.debug('q3 =>  '+q3);
        
        
        
        list<Batch__c> q4 = [ select name, Course__r.name, Course__r.Faculty_Name__r.name from Batch__c ];
       //     System.debug(b);
                   
        for ( Batch__c b : q4 ){
            
            b.Course__r.Faculty_Name__r.name = 'Ashok Goliya';
            
        }
        update q4;

        list<AggregateResult> q5 = [ select count_distinct(Student_Name__c) from Student__c 
                              	where Student_Name__c != NULL
                              ];
       
        
          
        
        list<Student__c> q6 = [ select Student_Name__c, age__c from Student__c where age__c>25 order by age__c]; 
       // System.debug(q6);
        
        
        
        
        list<list<SObject>> q7 =[ Find 'Testing' IN Name Fields Returning Student__c(name), Faculty__c(name) ];
        list<Student__c> r1 = q7.get(0);
        for(Student__c o : r1){
       //  System.debug(o);
        }
        list<Faculty__c> r2 = q7.get(1);
        for(Faculty__c o : r2){
     //    System.debug(o.Name);
        }
        
        
        
        
        list<String> name = new list<String>{'John','Jack','will','David'}; 			//{'Ashok','kailash','Kailash','bbaa'};
        list<Student__c> q8 = [ select Student_Name__c, age__c 
                                from Student__c 
                                where Registration_Date__c = THIS_QUARTER 
                                and Student_Name__c in :name 
                              ]; 
     //   System.debug(q8);    
        
        
        
              
        
       list<SObject> q9 = [ select Student_in_batch__r.Student_Name__c, Batch_of_student__r.name, 
                           		   Batch_of_student__r.Course__r.Name, 
                                   Batch_of_student__r.Course__r.Faculty_Name__r.name 
                            from Student_in_batch__c  
                            where  Student_in_batch__r.Student_Name__c like :'Kri%' and 
                            Batch_of_student__r.Course__r.Faculty_Name__r.name  like :'Kri%' and  
                            Batch_of_student__r.Course__r.Name != :'Php'
                          ];
        
       // System.debug(q9);
        
        
        
   /*    
        list<list<SObject>> q99 =[ Find '?*' IN Name Fields Returning Student__c(Student_Name__c where Student_Name__c like :'Kri%'), Faculty__c(name where name  like :'Kri%'), Course__c(name where Name != :'Php') ];
        list<Student__c> r1 = q7.get(0);
        for(Student__c o : r1){
       //  System.debug(o);
        }
        list<Faculty__c> r2 = q7.get(1);
        for(Faculty__c o : r2){
     //    System.debug(o.Name);
        }
        */
        
        
    }
    
    
    
    
    
    
    public static void q6a(String course, Decimal fee1, Decimal fee2){
        
          list<Student__c> res = [ select name, Student_Name__c, Course__c, Fees__c from Student__c where Course__c = :course and Fees__c > :fee1 and Fees__c < :fee2 ];
         
        for(Student__c s: res){
          
            System.debug('name : '+s.Student_Name__c+'   Course : '+s.Course__c+'       Fees : '+s.Fees__c);
        }
        
    }
    
    
}
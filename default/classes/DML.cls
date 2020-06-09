public class DML {

    
    
    
    
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static void m(){
        
        Account acc = new Account(name = 'Disney 2', numberofemployees = 1000);
        insert acc;
        
        Contact john = new Contact(lastname	= 'John2', accountid = acc.Id);
        Contact mark = new Contact(lastname	= 'Mark2', accountid = acc.Id);
        insert john;
        insert mark;
        
        
        Opportunity sell1 = new Opportunity(name = 'sell cartoons', CloseDate = Date.newInstance(2020, 01, 01) , stagename = 'Qualification', accountid = acc.Id);
        Opportunity sell2 = new Opportunity(name = 'sell tyre', CloseDate = Date.newInstance(2030, 01, 01) , stagename = 'Qualification', accountid = acc.Id);
        insert sell1;
        insert sell2;
        
        
    }
    
    public static void mm(){
        
        
        list<Opportunity> acc = [select closedate from Opportunity ];
       
            
            for(Opportunity o : acc){
                o.closedate = date.Today()+90;
            }
            
        
        
        update acc;
        
    }
    
     public static void merge_account(){
        
        
        list<Account> acc = [select name from Account where name like :'Disney%'];
       
           Account a1  = acc[0], a2 = acc[1];        
        
        merge a1 a2;
        
    }
    
    
    
    
    
    
    
    public static void m1(){
        
  
       
        list<Student__c> stu = [ select Student_Name__c, email__c ,X12th_Percent__c ,Fees__c, Hobbies__c, Aadhar__c ,Course__c from Student__c where CreatedDate = Today and isdeleted = true all rows];

        
       
        undelete stu;
    }
    
//        list<Student__c> stu = [ select Student_Name__c, email__c ,X12th_Percent__c ,Fees__c, Hobbies__c, Aadhar__c ,Course__c from Student__c where CreatedDate = Today and isdeleted = true all rows];

}
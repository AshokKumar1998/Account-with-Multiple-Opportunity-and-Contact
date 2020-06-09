public class test_ashok {

    public static void m1(){
        
        list<Account> acc = new list<Account>();
        for ( Integer i=0; i < 5; i++ )
            acc.add(new Account(name = 'test ashok '+i));
        acc.add(new Account());
        
        list<Opportunity> opp = new list<Opportunity>();
        Database.SaveResult[] res = Database.insert(acc,false);
        
        for ( Database.SaveResult ds : res ){
            
            
            if ( ds.issuccess() ){
                  System.debug('Success '+ds);
                opp.add( new Opportunity( name = 'Test Ashoka', closedate = System.today(), Stagename = 'Prospecting', accountid = ds.id ) );
                
            }else{
                System.debug('Failed '+ds);
            }
            
        }
        insert opp;
        System.debug('Opportunity : '+opp);
        
    }
    
    public static void m2(){
        list<Account> ac = new list<Account>();
        list<Account> acc = [ select name, ( select name from Opportunities ) from Account ];
        for ( Account a : acc ){
            
            if ( a.Opportunities.size() > 2 )
                ac.add(a);
            
        }
        delete ac;
    }
    
    public static void m3(){
        
         list<Account> acc = new list<Account>();
        for ( Integer i=0; i < 5; i++ )
            acc.add(new Account(name = i+'test ashok '+i));
        insert acc;
        
          list<Contact> con = new list<Contact>();
        for ( Integer i=0; i < 5; i++ )
            con.add(new Contact(lastname = i+'test ashok '+i, accountid = acc[i].id));
        insert con;
        
        delete acc;
    }
    
    public static void m4(){
        
        list<AggregateResult> res = [ select Batch_of_student__c, count(Student_in_batch__c) from Student_in_batch__c group by Batch_of_student__c ];
        
    }
   
    public static void m5(){
        
        list<Batch__c> res = [ select name, Course__r.name, Course__r.Faculty_Name__r.name from Batch__c ];
        
       
        
        for ( Batch__c b : res ){
            
            System.debug('Batch : '+b.name
                        + '  Course  '+b.Course__r.name
                        + '  Faculty  '+b.Course__r.Faculty_Name__r.name
                        );
            
        }
        
    }
    
    public static void m6(){
        
        list<AggregateResult> res = [ select FISCALYEAR, SUM(Amount) from Opportunity where isclosed = true and ownerid = :UserInfo.getUserId()  group by FISCALYEAR ];
        
    }
    
    public static void m7(){
        
    }
}
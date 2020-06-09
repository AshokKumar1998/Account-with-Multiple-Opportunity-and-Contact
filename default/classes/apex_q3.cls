public class apex_q3 {

    public static void con(){
        
        Date d = System.today();
        list<Contact> con = [ select Name, Email, Birthdate, Phone from Contact where (Email != Null and Phone != Null) and  (Ashoka__Weight__c > 100 or Birthdate = :d) ORDER BY Name DESC limit 5  ];
        System.debug(con);
    }
    
}


/*
 *  Question 4 =>   Type of collection apex support are
 * 				1 : List
 * 				2 : Set
 * 				3 : Map
 */
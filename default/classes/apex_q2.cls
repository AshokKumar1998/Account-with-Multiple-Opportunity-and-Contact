public class apex_q2 {

     public static void InsertParentChild() {
        Date dt = Date.today();
        dt = dt.addDays(7);
        Opportunity newOpportunity = new Opportunity(
            Name='QWERTY OpportunityWithAccountInsert',
            StageName='Prospecting',
            CloseDate=dt);
         
        Account accountReference = new Account(
            Ashoka__MyExtID_c__c='QWERTY1234');                
        newOpportunity.Account = accountReference;
        
         
        Account parentAccount = new Account(
            Name='QWERTY Hallie',
            Ashoka__MyExtID_c__c='QWERTY1234');      
        
         
        Database.SaveResult[] results = Database.insert(new SObject[] {
            parentAccount, newOpportunity });
         
        for (Integer i = 0; i < results.size(); i++) {
            if (results[i].isSuccess()) {
            System.debug('Successfully created ID: '
                  + results[i].getId());
            } else {
            System.debug('Error: could not create sobject '
                  + 'for array element ' + i + '.');
            System.debug('   The error reported was: '
                  + results[i].getErrors()[0].getMessage() + '\n');
            }
        }
    }
    
}
public class f1 {

    public static void mymethod(){
        
        System.debug('Go here');
        
        Integer num= 343443;
        
        System.debug('my number is : '+num);
        
        Double dnum=num/7;
        
        Date dd  = Date.newInstance(2019, 2, 30);
        
        System.debug('date : '+dd);
        
        Id id = '0009r823bkkfsdg';
        
        System.debug('id : '+id);
    }
    
    public static void main(){
        
        Acc__c a1 = new Acc__c(Account_Holder_Nme__c='jai ho');
        a1.Account_Holder_Nme__c = 'kumara';
        a1.Deposite_Amount__c = 45000;
        a1.Account_Type__c = 'Saving Account';
       
        System.debug('a1 : '+a1);
        
        SObject s1;
        s1 = new Acc__c();
        s1.put('Account_Holder_Nme__c', 'get out');
        s1.put('Deposite_Amount__c', 56000);
        
        System.debug('S1 name : '+S1.get('Account_Holder_Nme__c'));
    }
    
}
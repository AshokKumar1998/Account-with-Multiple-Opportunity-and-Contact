public class BeerSearchaAuraService {

   
   @AuraEnabled
   public static list<Ashoka__Beer__c> searchBeer(String searchParam){
       string n='%'+searchParam+'%';
       return [select Id, Name, Ashoka__Total_Quantity__c, Ashoka__Tags__c, Ashoka__Remaining_Quantity__c, Ashoka__Price__c, Ashoka__id__c, Ashoka__brewery_name__c, Ashoka__brewery__c, Ashoka__Alcohol__c from Ashoka__Beer__c where name like :n];
   }
}
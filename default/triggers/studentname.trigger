trigger studentname on Student__c (before update) {

    Student__c ss = Trigger.new[0];
    Student__c so = Trigger.old[0];
    
    ss.Student_Name__c = ss.Student_Name__c+so.Student_Name__c;
    String name =  ss.Student_Name__c;
    if( name.length() > 100 ){
        ss.adderror('Name can\'t be that much long');
    }
    
    
   /* for ( Student__c s : Trigger.old ){
        s.Student_Name__c = s.Student_Name__c+s.Student_Name__c;
    }*/
    
}
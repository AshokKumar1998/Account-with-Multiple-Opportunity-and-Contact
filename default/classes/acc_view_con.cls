public class acc_view_con {

    public list<Account> accList{get;set;}
    
    /*public acc_view_con(){
        
        accList = [ select name, numberofemployees, phone from Account ];
        
    }*/
    
    
     public acc_view_con( ApexPages.StandardController controller ){
        
         
        accList = [ select name, numberofemployees, phone from Account ];
        
    }


      
    public acc_view_con( rec_controller controller ){
        
         
        accList = [ select name, numberofemployees, phone from Account ];
        
    }
    
    
}
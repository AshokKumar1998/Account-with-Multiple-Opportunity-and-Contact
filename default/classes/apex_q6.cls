public class apex_q6 {
    
    public static  list<list<SObject>> func(String name){
        
        list<list<SObject>> res = [ FIND :name IN Name FIELDS RETURNING  Contact(Name), Lead (Name)   ];
        
        return res;
    }
    
}
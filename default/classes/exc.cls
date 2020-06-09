public class exc {

    public static void my(Integer age){
        
        try{
            if(age> 18){
                System.debug('You are eligible for vote');
            }else{
                throw new myexception();
            }
        }catch(myexception e){
            system.debug(e.myexception());
        }
        
    }
    
}
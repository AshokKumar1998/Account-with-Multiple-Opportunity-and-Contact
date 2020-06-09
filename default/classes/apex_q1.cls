public class apex_q1 {

    public static void counter(){
        
        String str = 'This this is is done by Code code';
        
        map<String, Integer> count = new map<String, Integer>();
        
        for ( String s : str.split(' ') ){
            
            if ( count.containsKey(s) ){
                Integer i = count.get(s);
                i++;
                count.put(s,i);
            }else{
                count.put(s,1);
            }
            
        }
        System.debug('Output: '+count);
        
    }
    
}
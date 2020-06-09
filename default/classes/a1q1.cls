public class a1q1 {
    
       public static void q1(){
       
        LIST<list<String>> unq = new list<list<String>>{new list<String>{'a;b;a;v;c','x;y;x;c;q'},new list<String>{'m;b;h;j;m','k;j;u'}};
        
        System.debug('List :  '+unq);
      
        list<String> l1 = new list<String>();
        list<String> ll = new list<String>();
        set<String>  ss = new set<String>();
        LIST<list<String>> unq2 = new list<list<String>>();
        integer i=0;
           
        ll = unq.get(i);
       
        for(String s: ll){
            
 				l1.clear();	
                ss.clear();  
                
                	ss.addAll(s.split(';'));
           	        l1.addall(ss);
                    l1.sort();
                 	
                unq2.add(new list<String>{string.join(l1, ';')});
            
            
			if(s.equals(ll.get(ll.size()-1))){
                
                	i++;
                	ll.addall( unq.get(i));
					System.debug(ll);
                
            }
          
        }
        
         System.debug('final List unique :  '+unq2);
       
    }
    
    
    
    public static void qq1(){
       
         LIST<list<String>> unq = new list<list<String>>{new list<String>{'a;b;a;v;c','x;y;x;c;q'},new list<String>{'m;b;h;j;m','k;j;u'}};
        
      
        System.debug('List :  '+unq);
      
     
        list<String> l1 = new list<String>();
        set<String> ss = new set<String>();
        
        LIST<list<String>> unq2 = new list<list<String>>();
        
        for(list<String> l: unq){
            
            for(String s:l){
 				l1.clear();	
                ss.clear();  
                
                	ss.addAll(s.split(';'));
           	        l1.addall(ss);
                    l1.sort();
                 	
                unq2.add(new list<String>{string.join(l1, ';')});
            }
          
        }
        
         System.debug('final List unique :  '+unq2);
       
    }

    
    public static void q2(){
        
        list<Integer> unq = new list<Integer>{1,2,3,4,5,6,7,8,9};
            Integer temp= unq[0],i=0,j=0;
        
         for (j=0;j<7;j++){
           temp=unq[unq.size()-1];         
           unq.remove(unq.size()-1);
           unq.add(0,temp);
           System.debug('rotate  left '+(i+1)+' time : '+unq);
   		 }
           
           
        System.debug('rotate  left 7 time : '+unq);
        
        unq = new list<Integer>{1,2,3,4,5,6,7,8,9};
        
        for (j=0;j<5;j++){
                
           temp=unq[0];
           unq.remove(0);
            unq.add(temp);
            System.debug('rotate  right '+(i+1)+' time : '+unq);
   		 }
        System.debug('rotate  right 5 time : '+unq);
        
        
        
    }
    

    public static void q3(){
     
        List<Integer> l1 = new List<Integer>{1,4,7,8,5};
        List<Integer> l2 = new List<Integer>{2,5,3,6,4,8,9,1};
        List<Integer> l3 = new List<Integer>{9,5,2,7,4,1};
            
        Set<integer> s = new set<integer>();
        s.addall(l1);
        s.retainall(l2);
        s.retainall(l3);
        
        System.debug(s);
            
            
        
    }
    
    
    public static void q4(){
        Boolean c=false;
        Integer max =0;
        list<Integer> arr = new list<Integer>{149,1,3,248,8,70,5};    
            for(Integer i=arr.size()-1;i>-1;i--){
                 
                if ( arr[i] > max ){
                    max=arr[i];
                    System.debug('leader is : '+arr[i]);
                }     
    	}
    }
    
  
}
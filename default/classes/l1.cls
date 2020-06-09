public class l1 {

    
    public static void listitem(){
        
        Map<String, Map<String, Map<String, list<String> > > > address = new Map<String, Map<String, Map<String, list<String> > > >();
        
       /* LIST<String> names = new LIST<String>{'ashok','vijay','antima'};
            names.add('bapu');
        LIST<String> names2 = new LIST<String>{'ashok','vijay','antima'};
            names2.add('bapu');
        names.addall(names2);
        System.debug('my list of names : '+names);
        
        set<String> sname = new set<String>{'go'};
        sname.addall(names);
        sname.addall(names2);
        System.debug('my set of names : '+sname);
        list<list<Integer>> matrix = new list<list<Integer>>{new list<Integer>{1,2,3},new list<Integer>{4,5,6},new list<Integer>{7,8,9}};
            matrix.add(new list<Integer>{11,22,33});
        
        System.debug('My Integer List  :  '+matrix);
           System.debug('Integer in List at 2*2 :  '+matrix.get(2).get(2));*/
        
    Account a2 = new Account(name='b');
        System.debug('a2 hashcode is ' + System.hashCode(a2));
    }  
    public static void slistitem(){
        LIST<Account> names = new LIST<Account>();
       names.add(new Account(name='ashoka',numberofemployees=5000));
        names.add(new Account(name='ashokaa',numberofemployees=50000));
        Set<Account> acc = new set<Account>{new Account(name='ashoka',numberofemployees=5000),new Account(name='ashoka',numberofemployees=5000)};
        System.debug('my list of names : '+names.get(0).name);
      System.debug('my set of account : '+acc);
    }
    public static void mpas(){
        map<integer,String> std = new map<Integer,String>{3=> 'amit',4=> 'vijay'};
        std.put(1,'ashok');
        std.put(2,'antima');
      System.debug('my map of students : '+std);
    }
    public static void q1(){
        
     LIST<list<String>> unq = new list<list<String>>{new list<String>{'a','b','a','v','c'},new list<String>{'x','y','x','c','q'}};
          unq.add(new list<String>{'m','b','h','j','m'});
        unq.add(new list<String>{'k','j','u'});
        
        System.debug('List created :  '+unq);
        
        unq.sort();
        
        System.debug('List sorted :  '+unq);
        
        for( Integer i=0;i<unq.size();i++){
            set<String> ss = new set<String>();
            ss.addAll(unq.get(i));
            //unq.add(i,unq.add(i).addall(ss));
        }
    }
}
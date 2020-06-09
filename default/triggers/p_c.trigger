trigger p_c on obj_B__c (before insert, before update, before delete) {


    System.debug('Trigger.new  '+Trigger.new);

    if ( trigger.isinsert ){
        
            list<obj_A__c> p = new list<obj_A__c>();
            map<id,obj_A__c> up = new map<id,obj_A__c>();
            list<obj_B__c> c = new list<obj_B__c>();
            map < String, obj_A__c> rec = ab_help.get_map();
            
            for ( obj_B__c b : Trigger.new ){
               
                String s = b.name+' '+b.Value_B__c;
                if( rec.containsKey(s) ){
                    obj_A__c aa = rec.get(s);
                    b.Parent_A__c = rec.get(s).id;
                    if ( b.pick__c == 'Dance' ){
                        
                        aa.No_of_Dance__c += 1; 

                    }else if ( b.pick__c == 'Walk' ){

                        aa.No_of_Walk__c += 1; 

                    }else{

                        aa.No_of_Eat__c += 1; 

                    }
                    up.put(b.Parent_A__c,aa);
                }else{
                    
                    if ( b.pick__c == 'Dance' ){
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Dance__c = 1) );
                    }else if ( b.pick__c == 'Walk' ){
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Walk__c = 1) );
                    }else{
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Eat__c = 1) );
                    }
                    
                    c.add(b);
                }
            }
            insert p;
            list<obj_A__c> np = new list<obj_A__c>();
            for (obj_A__c collection : up.values())
                 np.add(collection);
            update np;
            
            for ( Integer i = 0; i < p.size(); i++ ){
                
               c[i].Parent_A__c = p[i].id;
                    
            }
        
    }
    
    
    if ( Trigger.isupdate ){
        
            map<id,obj_A__c> up = new map<id,obj_A__c>();
            list<obj_B__c> old = Trigger.old;
            list<obj_A__c> p = new list<obj_A__c>();
            list<obj_B__c> c = new list<obj_B__c>();
            map < String, obj_A__c> rec = ab_help.get_map();
            map < id, obj_A__c> old_rec = ab_help.get_rec();
            Integer index = 0;
        
            for ( obj_B__c b : Trigger.new ){

                System.debug( 'new recor  ' +b );
                System.debug( 'old recor  ' +old.get(index) );
                
                String s = b.name+' '+b.Value_B__c;
                if( rec.containsKey(s) ){
                    
                    obj_A__c aa = rec.get(s);
                    obj_B__c o = old.get(index);


                    
                    if ( o.pick__c == 'Dance' ){
                        if( b.pick__c == 'Walk' || b.pick__c == 'Eat'){
                            aa.No_of_Dance__c -= 1; 
                        }
                            
                    }else if ( o.pick__c == 'Walk' ){
                        if( b.pick__c == 'Dance' || b.pick__c == 'Eat'){
                            aa.No_of_Walk__c -= 1; 
                        }
                            
                    }else if ( o.pick__c == 'Eat' ){
                        if( b.pick__c == 'Dance' || b.pick__c == 'Walk'){
                            aa.No_of_Eat__c -= 1; 
                        }
                            
                    }
                    
                    b.Parent_A__c = rec.get(s).id;
                    if ( b.pick__c == 'Dance' && o.pick__c != 'Dance' ){
                        aa.No_of_Dance__c += 1; 
                    }else if ( b.pick__c == 'Walk' && o.pick__c != 'Walk' ){
                        aa.No_of_Walk__c += 1; 
                    }else if ( b.pick__c == 'Eat' && o.pick__c != 'Eat' ){
                        aa.No_of_Eat__c += 1; 
                    }
                    up.put(b.Parent_A__c, aa);
                }else{

                    if ( b.Parent_A__c == null ) {

                        obj_B__c o = old.get(index);
                        obj_A__c aa = old_rec.get(o.Parent_A__c);

                       

                        if ( o.pick__c == 'Dance' ){
                                aa.No_of_Dance__c -= 1; 
                        }
                          else if ( o.pick__c == 'Walk' ){
                                aa.No_of_Walk__c -= 1; 
                        }
                          else if ( o.pick__c == 'Eat' ){
                                aa.No_of_Eat__c -= 1; 
                        }
                        up.put(o.Parent_A__c, aa);
                    }
                    
                    
                    if ( b.pick__c == 'Dance' ){
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Dance__c = 1) );
                    }else if ( b.pick__c == 'Walk' ){
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Walk__c = 1) );
                    }else{
                       p.add( new obj_A__c(name = b.Name, Value_B__c = b.Value_B__c, No_of_Eat__c = 1) );
                    }
                    
                    c.add(b);
                }
                index++;
            }
            insert p;
            list<obj_A__c> np = new list<obj_A__c>();
            for (obj_A__c collection : up.values())
                 np.add(collection);
            update np;
                
                for ( Integer i = 0; i < p.size(); i++ ){
                    
                   c[i].Parent_A__c = p[i].id;
                        
                }
            
    }
    
    if ( Trigger.isdelete ){
        
            list<obj_A__c> up = new list<obj_A__c>();
            map < String, obj_A__c> rec = ab_help.get_map();
        
            for ( obj_B__c b : Trigger.old ){
                
                String s = b.name+' '+b.Value_B__c;
                if( rec.containsKey(s) ){
                    
                    obj_A__c aa = rec.get(s);
                    
                    if ( b.pick__c == 'Dance' ){
                     
                        aa.No_of_Dance__c -= 1; 
                        up.add(aa);
                    }else if ( b.pick__c == 'Walk' ){
                   
                        aa.No_of_Walk__c -= 1; 
                        up.add(aa);
                    }else{
                   
                        aa.No_of_Eat__c -= 1; 
                        up.add(aa);
                    }
                   
                }
            }
        
            update up;
           
    }
}
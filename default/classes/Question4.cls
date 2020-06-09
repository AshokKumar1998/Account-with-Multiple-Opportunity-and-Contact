public with sharing class Question4 {

    public id current_user;

    public Question4() {

    }

    Pagereference pr;
    public Pagereference check(){

        String pageName = ApexPages.currentPage().getUrl().substringAfter('apex/');
        current_user = UserInfo.getUserId();
        System.debug('user name  '+UserInfo.getUserName());
        if ( UserInfo.getUserName() == 'ashok@poornima.com' ){
            if ( pageName != 'Question4_admin' ){
              System.debug('going to admin');
              pr = new Pagereference('https://c.ap16.visual.force.com/apex/Question4_admin');
             
            }
        }else {

            if ( pageName == 'Question4' ){
                System.debug('going to other');
                pr = new Pagereference('https://c.ap16.visual.force.com/apex/Question4_other');
               
              }
            
           
        }

        return pr; 

    }

}
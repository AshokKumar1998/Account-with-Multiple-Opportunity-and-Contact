public class Question1_extension {
    
    public Id i{get;set;}
    public List<Opportunity> opp{get;set;}
    public List<Contact> con{get;set;}
    public List<Case> acc_case{get;set;}
    
    Opportunity oo;

    public String email{get;set;}
    public String message{get;set;}

    public Question1_extension() {
       
    }

    public Question1_extension(Apexpages.StandardController cont) {
       // oo = [ SELECT Name, Amount, Stagename FROM Opportunity where id = :cont.getId() ];
       // message = 'Dear '+oo.Name+', \nTheir Is Balance of '+oo.Amount+', You are on Stage '+oo.StageName;
        this.i = cont.getId();

    }

    Public string selectedname{get;set;}

    Public List<SelectOption> getselectedaccnamefields(){
        List<Selectoption> values = new List<Selectoption>();
        
        values.add(new SelectOption('','-None-'));
        values.add(new selectOption('A', 'Opportunity'));
        values.add(new selectOption('B' ,'Contacts'));
        values.add(new selectOption('C', 'Cases'));
        
        return values; 
    }

    public void getfetch_related(){

        if ( selectedname.equals('A')){
                con = new List<Contact>();
                acc_case = new List<Case>();
                opp = [ SELECT Name, Closedate, Stagename, amount FROM Opportunity where AccountId = :i ];
                //return opp;

        }else if ( selectedname.equals('B')){
                opp = new List<Opportunity>();
                acc_case = new List<Case>();
                con = [ SELECT Name, Birthdate, Department, Description FROM Contact where AccountId = :i ];
                //return con;

        }else if ( selectedname.equals('C')){
                con = new List<Contact>();
                opp = new List<Opportunity>();
                acc_case = [ SELECT CaseNumber, Origin, Reason, ContactEmail FROM Case where AccountId = :i ];
               // return acc_case;
        }
       //return [ SELECT Name FROM Account ];

    }


            public void sendingEmail(){
                Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
                String[] sendingTo = new String[]{email};
                semail.setToAddresses(sendingTo);
                semail.setSubject('Opportunity Detail');
                semail.setPlainTextBody(message);
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] {semail});
                message+='\n\nEmail Sent !!!';
            }


}
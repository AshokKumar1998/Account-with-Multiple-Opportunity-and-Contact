public class Question2 {

    public List<Account> acc{get;set;}

    public Question2() {

    }
    
    public Question2(Apexpages.StandardController cont) {

        acc = [ SELECT Id, Name, Phone, NumberofEmployees FROM Account where createddate = TODAY ];
    }

    public Pagereference go_to_standard(ID i){

        return new Pagereference('/'+i);
    }
    

}
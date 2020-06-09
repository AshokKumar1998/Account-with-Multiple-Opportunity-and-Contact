public class search_control {

    public String search_name{get;set;}

    public List<Account> acc{get;set;}

    public Id i{get;set;}

    public void search(){

        acc = [ SELECT Name, Numberofemployees FROM Account where Name like :search_name+'%' ];

    }


}
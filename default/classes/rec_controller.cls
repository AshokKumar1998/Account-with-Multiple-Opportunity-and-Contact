public class rec_controller {
    
    public String acc_name{get;set;}
    public Integer no_emp{get;set;}

	public String opp_name{get;set;}
	public Date op_Closedate{get;set;}
	public Decimal op_amount{get;set;}


	public String c_fn{get;set;}
	public String c_ln{get;set;}
    public String phn{get;set;}
    
    
    public PageReference Save_rec(){
        
        Account a = new Account( name = acc_name, numberofemployees = no_emp );
        insert a;
        
        Opportunity o = new Opportunity( Name = opp_name, closedate = op_Closedate, Stagename = 'Prospecting', amount = op_amount, accountid = a.id );
        Contact c = new Contact( firstname = c_fn, lastname = c_ln, phone = phn, accountid = a.id  );
        
        insert o;
        insert c;
        
        return new PageReference('/'+a.Id);
        
    }

}
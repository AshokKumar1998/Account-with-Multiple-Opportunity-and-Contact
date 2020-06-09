({
    insert_account1 : function(component,  event, helper) {
        console.log('inside click create account');
        var action = component.get("c.insert_accounts");
        var account = component.get("v.newAccount");
        var my_ids = component.get( "v.accounts" );
        console.log('account name '+component.find("Name").get("v.value"));
        action.setParams({
            
            "a" : account
            
        });
        
        action.setCallback(this,function(a){
            
            console.log('account  '+a.getReturnValue());
            my_ids.push(a.getReturnValue());
            component.set("v.accounts", my_ids);
            
        });
        $A.enqueueAction(action);
       
    },
    goto : function(component, event) {
        
        var ctarget = event.currentTarget;
        var id_str = ctarget.dataset.value;
        console.log(id_str);
        window.location = "https://samratashoka-dev-ed.my.salesforce.com/"+id_str;
        
    }
})
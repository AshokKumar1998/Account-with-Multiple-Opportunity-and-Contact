({
    searchkeyname : function(component, event) {
        
        var search = event.getParam("search_name");
        var action = component.get("c.search_account");
        
        action.setParams({
            "acc_name" : search
        });
        
        action.setCallback(this,function(a){
            component.set("v.accounts", a.getReturnValue());
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
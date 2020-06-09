({
    doInit : function(component, event) {
		var action = component.get("c.getContacts");
        
        action.setCallback(this,function(a){
            
            component.set("v.contacts", a.getReturnValue());
            
        });
        $A.enqueueAction(action);
    }
,    
    searchkeychange : function(component, event) {
    
    	var search = event.getParam("SearchKey");
		var action = component.get("c.getContact_name");
        
        action.setParams({
        
        "nam" : search
  		});
            
        action.setCallback(this,function(a){
                    
                    component.set("v.contacts", a.getReturnValue());
                    
                });
    $A.enqueueAction(action);
    }
})
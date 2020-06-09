({
	locationChange : function(component, event, helper) {
		
        var token = event.getParam("token");
        
        if( token != null && token.indexOf('contact/')===0){
            var contactid = token.substr(token.indexOf('/')+1);
            var action = component.get("c.getContact_id");
            
            action.setParams({
                
                "i": contactid
                
            });
            
             action.setCallback(this,function(a){
                    
                    component.set("v.contact", a.getReturnValue());
                    
                });
    $A.enqueueAction(action);
        }
        
	}
})
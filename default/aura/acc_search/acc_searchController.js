({
	searchName : function(component, event, helper) {
		
        var acc_event = $A.get("e.c:acc_name_event");
        
        acc_event.setParams({"search_name": event.target.value});
        
        acc_event.fire();
        
	}
})
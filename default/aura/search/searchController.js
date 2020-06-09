({
	searchKey : function(component, event) {
		
        var myevent = $A.get("e.c:searchkey");
        
        myevent.setParams({"SearchKey":event.target.value});
        
        myevent.fire();
        
	}
})
({
	executeEvt : function(component, event, helper) {
        var compevt = $A.get('e.c:ApplicationEvent');
        alert('I am Application Source Component');
        compevt.fire();
	}
})
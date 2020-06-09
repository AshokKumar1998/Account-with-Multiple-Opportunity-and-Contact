({
	executeEvt : function(component, event, helper) {
		var compevt = component.getEvent('SourceComponent');
        alert('I am SourceComponent');
        compevt.fire();
	}
})
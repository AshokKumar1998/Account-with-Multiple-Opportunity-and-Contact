({
	showinfo : function(component, event, helper) {
		var hit = event.getSource();
        component.set('v.beerId',hit.get('v.name'));
	}
})
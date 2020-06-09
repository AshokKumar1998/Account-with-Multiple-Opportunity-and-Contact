({
	insert_account1 : function(component,  event, helper) {
        console.log('inside click create account');
		var action = component.get("c.insert_account");
		var account = component.get("v.newAccount");
        
        action.setParams({
        
        	"a" : account
        
  		});
        
        action.setCallback(this,function(a){
                    
                    console.log('account  '+a.getReturnValue());
                    
                });
    	$A.enqueueAction(action);
	},
    
    doInit: function(component, event, helper) {
        
        
        var action2 = component.get("c.getpickval");
        var opts2 = [];
        action2.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                if (allValues != undefined && allValues.length > 0) {
                    opts2.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts2.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.set("v.pick_val", opts2);
            }
        });
        $A.enqueueAction(action2);
        
    },
   
})
({
	insert_account1 : function(component,  event, helper) {
        console.log('inside click create account');
		var action = component.get("c.insert_account_opp_con");
		var account = component.get("v.newAccount");
        action.setParams({
        
        	"a" : account,
            "con": component.get("v.contactList"),
            "opp": component.get("v.oppList")
        
  		});
        
        action.setCallback(this,function(a){
                    
            console.log('account  '+a.getReturnValue());
            var stat = a.getReturnValue();
            if (stat != null) {
                 window.location = "https://samratashoka-dev-ed.my.salesforce.com/"+stat;
            }else{
                alert('Please Enter Data correctly');
            }
                    
                });
    	$A.enqueueAction(action);
	}
    ,
    doInit: function(component, event, helper) {
        helper.createObjectData(component, event);
        helper.createObjectData_opp(component, event);
    },
 
    
    addNewRow: function(component, event, helper) {
        
        helper.createObjectData(component, event);
    },
    
    
    removeDeletedRow: function(component, event, helper) {
        
        var index = event.getParam("indexVar");
        
        var AllRowsList = component.get("v.contactList");
        AllRowsList.splice(index, 1);
        
        component.set("v.contactList", AllRowsList);
    },
 
    
    addNewRow_opp: function(component, event, helper) {
        
        helper.createObjectData_opp(component, event);
    },
    
    
    removeDeletedRow_opp: function(component, event, helper) {
        
        var index = event.getParam("indexVar");
        
        var AllRowsList = component.get("v.oppList");
        AllRowsList.splice(index, 1);
        
        component.set("v.oppList", AllRowsList);
    },

    handleSuccess: function(component, event, helper) {
        var params = event.getParams();
        var action = component.get("c.insert_account_opp_con");
        action.setParams({
        
        	"i" : params.response.id,
            "con": component.get("v.contactList"),
            "opp": component.get("v.oppList")
        
  		});
        
        action.setCallback(this,function(a){
                    
            console.log('account  '+a.getReturnValue());
            var stat = a.getReturnValue();
            if (stat != null) {
                 window.location = "https://samratashoka-dev-ed.my.salesforce.com/"+stat;
            }else{
                alert('Please Enter Data correctly');
            }
                    
                });
    	$A.enqueueAction(action);
    }
    
})
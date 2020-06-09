({
	insert_account1 : function(component,  event, helper) {
        console.log('inside click create account');
		var action = component.get("c.insert_account");
		var account = component.get("v.newAccount");
        console.log('account name '+component.find("Name").get("v.value"));
        action.setParams({
        
        	"a" : account
        
  		});
        
        action.setCallback(this,function(a){
                    
                    console.log('account  '+a.getReturnValue());
                    
                });
    	$A.enqueueAction(action);
	}
    ,
     handleShowActiveSectionName: function (cmp, event, helper) {
        alert(cmp.find("accordion").get('v.activeSectionName'));
    },
    handleToggleSectionD: function (cmp) {
        cmp.set('v.isDVisible', !cmp.get('v.isDVisible'));
    }
})
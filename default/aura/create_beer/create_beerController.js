({
    insert : function(component, event, helper) {
        var name = component.get("v.name");
        var createAcountContactEvent = $A.get("e.force:createRecord");
        createAcountContactEvent.setParams({
            "entityApiName": "Ashoka__Beer__c",
            "defaultFieldValues": {
                'Name' : name
            }
        });
        createAcountContactEvent.fire();
    }
})
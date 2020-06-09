({
    createmodal : function(component, evt, helper) {
        
        component.find('overlayLib').showCustomModal({
            header: "Application Confirmation",
            body: "modalBody",
            showCloseButton: true,
            footer:"footer",
            showCloseButton:true, 
            cssClass: "mymodal",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });
    },
    nav : function(component, evt, helper) {
        var page = component.find("navService");
        var pageReference = {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: "MyAccounts"
            }
        };
        page.navigate(pageReference);
    }
})
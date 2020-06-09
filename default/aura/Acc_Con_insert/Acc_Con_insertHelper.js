({
	 createObjectData: function(component, event) {
        var RowItemList = component.get("v.contactList");
        RowItemList.push({
            'sobjectType': 'Contact',
            'FirstName': '',
            'LastName': '',
            'Phone': ''
        });
         
        component.set("v.contactList", RowItemList);
    },
    
    validateRequired: function(component, event) {
        var isValid = true;
        var allContactRows = component.get("v.contactList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].FirstName == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
     createObjectData_opp: function(component, event) {
        var RowItemList = component.get("v.oppList");
        RowItemList.push({
            'sobjectType': 'Opportunity',
            'Name': '',
            'CloseDate': '',
            'StageName': ''
        });
         
        component.set("v.oppList", RowItemList);
    },
    
    validateRequired_opp: function(component, event) {
        var isValid = true;
        var allContactRows = component.get("v.oppList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].Name == '') {
                isValid = false;
                alert('First Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
             if (allContactRows[indexVar].CloseDate == '') {
                isValid = false;
                alert('First Date Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
             if (allContactRows[indexVar].StageName == '') {
                isValid = false;
                alert('First Stage Name Can\'t be Blank on Row Number ' + (indexVar + 1));
            }
        }
        return isValid;
    },
})
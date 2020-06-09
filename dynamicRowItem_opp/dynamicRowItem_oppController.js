({
	 AddNewRow : function(component, event, helper){
        component.getEvent("AddRowEvt_opp").fire();     
    },
    
    removeRow : function(component, event, helper){
       component.getEvent("DeleteRowEvt_opp").setParams({"indexVar" : component.get("v.rowIndex2") }).fire();
    }, 
})
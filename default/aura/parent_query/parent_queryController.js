({
    doInit: function(component, event, helper) {
        
        var action = component.get("c.getobjectOptions");
        action.setParams({
        });
        var opts = [];
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.set("v.options_obj", opts);
            }
        });
        $A.enqueueAction(action);
    },
    
    onobjectChange: function(component, event, helper) {
        var obj = event.getSource().get("v.value").toString();
        
        var action = component.get("c.getobjectfield");
        action.setParams({
            "objObject" : obj
        });
        var opts = [];
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "optionClass",
                        label: "--- None ---",
                        value: ""
                    });
                }
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.set("v.options_field", opts);
            }
        });
        $A.enqueueAction(action);
    },
    
    onfieldChange: function(component, event, helper) {
        var obj = component.get("v.selectedValue").toString();
        var field = component.get("v.selectedfield").toString();
        var action = component.get("c.getfieldtype");
        action.setParams({
            "objObject" : obj,
            "field" : field
        });
        var opts = []; component.set("v.operator", opts); component.set("v.entered_val", ""); component.set("v.pick_val", opts);
        action.setCallback(this, function(response) {
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                
                component.set("v.fieldtype", response.getReturnValue());
                if ( allValues == 'STRING' || allValues == 'EMAIL' || allValues == 'PHONE' || allValues == 'ID' ){
                    component.set('v.isDVisible2', !component.get('v.isDVisible2'));
                     component.set('v.isDVisible', !component.get('v.isDVisible2'));
                    console.log('->  String');
                    opts.push({
                        label: "=",
                        value: "="
                    });
                    opts.push({
                        label: "!=",
                        value: "!="
                    });
                    component.set("v.operator", opts);
                }else if( allValues == 'CURRENCY' || allValues == 'DATE' || allValues == 'DOUBLE' || allValues == 'NUMBER'){
                    component.set('v.isDVisible2', !component.get('v.isDVisible2'));
                    component.set('v.isDVisible', !component.get('v.isDVisible2'));
                    console.log('->  Number');
                    opts.push({
                        label: "<",
                        value: "<"
                    });
                    opts.push({
                        label: ">",
                        value: ">"
                    });
                    component.set("v.operator", opts);
                }else if ( allValues == 'PICKLIST' ){
                    console.log('->  Picklist');
                    component.set('v.isDVisible', !component.get('v.isDVisible'));
                    component.set('v.isDVisible2', !component.get('v.isDVisible'));
                    /////////////////////////////////////////////////////////////////////////
                    
                    console.log('->  String');
                    opts.push({
                        label: "=",
                        value: "="
                    });
                    opts.push({
                        label: "!=",
                        value: "!="
                    });
                    component.set("v.operator", opts);
                    
                    var obj = component.get("v.selectedValue").toString();
                    var field = component.get("v.selectedfield").toString();
                    var action = component.get("c.getpickval");
                    action.setParams({
                        "objObject" : obj,
                        "field" : field
                    });
                    var optss = [];
                    action.setCallback(this, function(response) {
                        console.log('->  pick : '+response.getReturnValue());
                        if (response.getState() == "SUCCESS") {
                            var allValues = response.getReturnValue();
                            if (allValues != undefined && allValues.length > 0) {
                                optss.push({
                                    class: "optionClass",
                                    label: "--- None ---",
                                    value: ""
                                });
                            }
                            for (var i = 0; i < allValues.length; i++) {
                                optss.push({
                                    class: "optionClass",
                                    label: allValues[i],
                                    value: allValues[i]
                                });
                            }
                            component.set("v.pick_val", optss);
                        }
                    });
                    $A.enqueueAction(action);
                    
                    /////////////////////////////////////////////////////////////////////////////
                    
                    
                }else{
                    alert('Sorry It is niether String nor Number.     It is '+allValues);
                }
            }
        });
        $A.enqueueAction(action);
    },
    
    onfieldpickChange: function(component, event, helper) {
        var val = event.getSource().get("v.value").toString();
        component.set("v.entered_val", val);
        component.set("v.action", "=");
    },
    
    searchName : function(component, event, helper) {
		
		component.set("v.entered_val", event.target.value);
        
	},
    
    go_for_search: function(component, event, helper) {
        var obj = component.get("v.selectedValue").toString();
        var opt = component.get("v.action").toString();
        var con = component.get("v.entered_val").toString();
        var field = component.get("v.selectedfield").toString();
        var allValues = component.get("v.fieldtype").toString();
        
       /* var field = component.find("enter_data").get("v.value");
        console.log('--== '+field);
        if ( field == undefined || field == '' || field == null ){
            var field = component.get("v.selectedfield").toString();
        }*/
         var query = "";
        if ( allValues == 'STRING' || allValues == 'EMAIL' || allValues == 'PHONE' || allValues == 'ID' || allValues == 'PICKLIST' ){
                 query = "SELECT Id, "+field+" FROM "+obj+" WHERE "+field+" "+opt+" '"+con+"'";
             
        }else if( allValues == 'CURRENCY' || allValues == 'DATE' || allValues == 'DOUBLE' || allValues == 'NUMBER'){
                 query = "SELECT Id, "+field+" FROM "+obj+" WHERE "+field+" "+opt+" "+con+""; 
             
         }
        
        var acc_event = $A.get("e.c:parent_query_event");
        
        acc_event.setParams({"search_": query, "search_f": field, "search_o": obj});
        
        acc_event.fire();
        
       
    },
    
})
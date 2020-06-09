({
    
    init: function(component, event, helper) {
        
        var action = component.get("c.getselectOptions");
        action.setParams({   });
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
                
                component.set('v.options', opts);
            }
            
        });
        $A.enqueueAction(action);
        
        
        var action2 = component.get("c.getchildrecords");
        var par = component.get('v.ids').toString();
        action2.setParams({ "parent" : par });
        action2.setCallback(this,function(a){
            
            component.set("v.loanvenders", a.getReturnValue());
            
        });
        $A.enqueueAction(action2);
        
        
        
        
        var action3 = component.get("c.get_all_records");
        action3.setParams({ "parent" : par });
        action3.setCallback(this,function(response){
            
            
            if (response.getState() == "SUCCESS") {
                
                component.set('v.response', JSON.parse( response.getReturnValue()) );
                
                
            }});
        $A.enqueueAction(action3);
        
    },
    
    onChange: function(component, event, helper) {
        
        var pick = component.get("v.selectedValue");
        var all = component.get("v.response");
        var sel = [];var unsel = [];
        
        //////////////////////////////////////////
        
        try {
            var res = component.get('v.new_selected');//[pick];//.toString().split(",");
            var acc_to_pick = res[pick];
            if( acc_to_pick != null || acc_to_pick != '' || acc_to_pick != undefined  ){//|| res != []
                
                var res2 = acc_to_pick.toString().split(",");
                console.log('Coming record 1st --> '+acc_to_pick);
                component.set('v.values', res2);
                
            }else{
                
                var allselected = all["selected"] ;
                var selected = allselected[pick] ;
                
                
                for (var i = 0; i < selected.length; i++) {
                    
                    let rec = selected[i];
                    var ald = component.get('v.tosearch').toString();
                    console.log('adding selected --> '+rec.Ashoka__Vender__r.Id+'  into -> '+ald);
                    component.set('v.tosearch', ald+' '+rec.Ashoka__Vender__r.Id );
                    sel.push(rec.Ashoka__Vender__r.Id);
                    
                }
                
                component.set('v.values', sel);
                
            }
            
        } catch(err) {
            
            console.log('error onChange  '+ err.message);
            
            var allselected = all["selected"] ;
            var selected = allselected[pick] ;
            
            
            for (var i = 0; i < selected.length; i++) {
                
                let rec = selected[i];
                
                    var ald = component.get('v.tosearch');
                    console.log('adding selected --> '+rec.Ashoka__Vender__r.Id+'  into -> '+ald);
                    component.set('v.tosearch', ald+' '+rec.Ashoka__Vender__r.Id );
                sel.push(rec.Ashoka__Vender__r.Id);
                
            }
            
            component.set('v.values', sel);
            
        }
        
        var allunselected = all["unselected"];
        var unselected = allunselected[pick];
        //  console.log('all unselected record  --> '+allunselected);
        //  console.log('unselected record  --> '+unselected); 
        
        for (var i = 0; i < unselected.length; i++) {
            let rec = unselected[i];
            //     console.log('unselected record  Name ==> '+rec.Name);  
            //     console.log('unselected record  Id ==> '+rec.Id);  
            unsel.push({
                
                label: rec.Name,
                value: rec.Id
            });
        }
        
        component.set('v.records', unsel);
        
    },
    
    handleChange: function (component, event) {
        try {
            var selectedOptionValue = event.getParam("value");
             component.set('v.tosearch', selectedOptionValue.toString());
            component.set('v.Selecteds',selectedOptionValue); 
            var pick = component.get("v.selectedValue");
            
            var res = selectedOptionValue.toString().split(",");
            
            console.log('old record    --> '+component.get('v.new_selected'));
            
            var data = component.get('v.new_selected');
            
            console.log('old record  whole  --> '+data);
            
            if ( data == null ){
                console.log(' == new key pair ==');	
                
                var obj = {};
                obj[pick] = res+'' ;
                component.set('v.new_selected',obj); 
            }
            else{
                try{
                    var data2 =data[pick];
                    
                    if ( data2 != undefined || data2 != null ){
                        console.log('setting new data into old record  pick  --> '+data2);
                        data[pick] = res+'';
                        component.set('v.new_selected',data);
                    }else{
                        console.log(' N-- old key pair -- ');
                        var obj = {};
                        obj[pick] = res+'' ;
                        data[pick]= res+'';
                        component.set('v.new_selected',data);
                    }
                }catch(err){
                    
                    console.log('error on inside swap  '+ err.message);
                    console.log(' N-- old key pair -- ');
                    var obj = {};
                    obj[pick] = res+'' ;
                    //Object.assign({  obj }, data);
                    data[pick]= res+'';
                    component.set('v.new_selected',data);
                }
                
                
            }
            
            // LAST PRINT
           /* var printObj = function(obj) { 
                var string = ''; 
                
                for(var prop in obj) { 
                    if(typeof obj[prop] == 'string') { 
                        string+= prop + ': ' + obj[prop]+'; '; 
                    } 
                    else { 
                        string+= prop + ': { ' + print(obj[prop]) + '}'; 
                    } 
                } 
                
                return string; 
            } 
            function gfg_Run() {  
                console.log('new record    ==> '+printObj(component.get('v.new_selected'))) ; 
            } 
            gfg_Run();*/
        }
        catch(err) {
            console.log('error on swap  '+ err.message);
            
        }        
    },
    
    change_parent: function (component, event, helper) {
        
        
        var action = component.get("c.getchange");
        var sel = component.get('v.new_selected');//.toString();
        var par = component.get('v.ids').toString();
        
       /* if ( sel == '' ){
            sel = '--';
        }
        */
        console.log('Send  '+sel+'  par  '+par+'  act  '+action);
        
        action.setParams({
            
            "selected" : sel,
            "parent" : par
            
        });
        
        action.setCallback(this,function(a){
            
            console.log('Return  '+a.getReturnValue());
            
        });
        $A.enqueueAction(action);
        
        var action2 = component.get("c.getchildrecords");
        
        action2.setParams({
            
            "parent" : par
            
        });
        
        action2.setCallback(this,function(a){
            
            component.set("v.loanvenders", a.getReturnValue());
            
        });
        $A.enqueueAction(action2);
        
        
        var action3 = component.get("c.get_all_records");
        action3.setParams({ "parent" : par });
        action3.setCallback(this,function(response){
            
            
            if (response.getState() == "SUCCESS") {
                
                component.set('v.search', JSON.parse( response.getReturnValue()) );
                
                
            }});
        $A.enqueueAction(action3);
        
    },
    
    searchName : function(component, event, helper) {
		
		var to = event.target.value;
        var unsel = [];
        var pick = component.get("v.selectedValue");
        var all = component.get("v.response");
        var allunselected = all["unselected"];
        var unselected = allunselected[pick];
        
        for (var i = 0; i < unselected.length; i++) {
            let rec = unselected[i];
            
                console.log('Already selected  --> '+component.get('v.tosearch').toString());
                console.log('Coming name  --> '+rec.Name+'          Coming id --> '+rec.Id);
            
            if ( rec.Name.includes(to) ||  component.get('v.tosearch').toString().includes(rec.Id) )
            unsel.push({
                
                label: rec.Name,
                value: rec.Id
            });
        }
        
        component.set('v.records', unsel);
	},
})
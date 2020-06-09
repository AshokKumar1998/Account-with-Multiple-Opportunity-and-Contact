({
	searchkeyname : function(component, event) {
		
		var search = event.getParam("search_");
        var obj = event.getParam("search_o");
        var field = event.getParam("search_f").toString();
		var action = component.get("c.execute");
        component.set("v.val", field);
        action.setParams({
        
        "query" : search
  		});
           var opts = [];  
        action.setCallback(this,function(a){
                    
            
            if (a.getState() == "SUCCESS") {
                console.log('a ->  '+a.getReturnValue());
                var yourDataStr = JSON.stringify(a.getReturnValue()) ;
                
                var allValues = JSON.parse( a.getReturnValue() );
                console.log(' allValues->  '+allValues);
              
                  
                
                for (var i = 0; i < allValues.length; i++) {
                    var rec = allValues[i];
                   
                        var recid = rec.id+'';
                    	var recval;
                     console.log(' ------>  '+rec[field]);
                    try{
                         recval = rec[field+''];
                        if(recval == undefined){
                            recval = "Don't hav value";
                        }
                    }catch(err){
                        recval = "Don't hav value";
                    }
                    	console.log('rec->  '+recid+'    '+recval);
                           
                    opts.push( 'Id ->  '+recid+'                '+field+'-> '+recval );
                }
                component.set("v.js_data", opts);
            }
                });
    
    	$A.enqueueAction(action);
        
	}
})
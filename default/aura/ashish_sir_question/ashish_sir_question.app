<aura:application >
    
     <link href='/resource/bootstrap/' rel="Stylesheet" />

    <div class="navbarnavbar-default navbar-static-top" role="navigation" >

        <div class="container">

            <div class="navbar-header">

                <a href="#" class="navbar-brand">

                    Query Record
                </a>

            </div>
    

        </div>

    </div>

    

    <div class="container">

        <div class="row">
            

           <div class="slds-box slds-box_small">
                
               <c:parent_query/>
               <c:child_query/>

           </div>
            
          
           

        </div>


    </div>
    
	
</aura:application>
<aura:application>

    <link href='/resource/bootstrap/' rel="Stylesheet" />

    <div class="navbarnavbar-default navbar-static-top" role="navigation" >

        <div class="container">

            <div class="navbar-header">

                <a href="#" class="navbar-brand">

                    Lightning Contacts

                </a>

            </div>
    

        </div>

    </div>

    

    <div class="container">

        <div class="row">

           <div class="col-sm-4">
               
 				<c:search/>
               <c:Contactlist/>

           </div>
            
            <div class="col-sm-8">
                
                
               <c:ContactDetails/>

           </div>

        </div>


    </div>
    
</aura:application>
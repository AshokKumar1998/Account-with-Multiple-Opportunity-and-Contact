trigger ass4_6 on Lead (after insert,after update) {

    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    
     for (Lead lead : Trigger.new) {
            if (lead.isConverted == false && lead.leadsource == 'Phone Inquiry') {
            System.debug('converting lead');
            Database.LeadConvert lc = new Database.LeadConvert();
            lc.setLeadId(lead.Id);

                lc.setdonotcreateopportunity(false);
            String oppName = lead.Name;
            lc.setOpportunityName(oppName);

           
            lc.setConvertedStatus(convertStatus.MasterLabel);

            Database.LeadConvertResult lcr = Database.convertLead(lc);
                
                System.debug('LCR  '+lcr);
            }
         System.debug('Record  =  > ' + lead);
     }
}
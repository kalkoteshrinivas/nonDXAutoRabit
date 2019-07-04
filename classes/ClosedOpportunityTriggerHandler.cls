public class ClosedOpportunityTriggerHandler{
    
    public static final String CONST_CLOSED_WON = 'Closed Won';
    public static void createTaskforClosedOpportunities(Map<Id, Opportunity> mapNewOpportunity, Map<Id, Opportunity> mapOldOpportunity)
    {
        List<Opportunity> lstFilteredOpp = new List<Opportunity>();
        Opportunity oOldOpportunity;
        for(Opportunity oNewOpp: mapNewOpportunity.values())
        {
            if(Trigger.isUpdate)
            {
                oOldOpportunity = mapOldOpportunity.get(oNewOpp.Id);
            }
            if((Trigger.isInsert && oNewOpp.StageName == CONST_CLOSED_WON) || 
               (Trigger.isUpdate && oNewOpp.StageName == CONST_CLOSED_WON && oOldOpportunity.StageName != CONST_CLOSED_WON))
               {
                   lstFilteredOpp.add(oNewOpp);        
               }
        }
        
        if(lstFilteredOpp.isEmpty())
        {
            return;
        }
        
        List<Task> lstTask = new List<Task>();
        for(Opportunity oFilteredOpp: lstFilteredOpp)
        {
            lstTask.add(createTaskForOpp(oFilteredOpp));    
        }

        insert lstTask;
    }
    
    private static Task createTaskForOpp(Opportunity oOpportunity)
    {
        Task oTask = new Task();
        oTask.Subject = 'Follow Up Test Task';
        oTask.WhatId = oOpportunity.Id;
        return oTask;
    
    }
}
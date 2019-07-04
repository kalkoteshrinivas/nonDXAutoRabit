trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {

    if(Trigger.isAfter && (Trigger.isUpdate || Trigger.isInsert))
    {
        ClosedOpportunityTriggerHandler.createTaskforClosedOpportunities(Trigger.newMap, Trigger.OldMap);
    }
}
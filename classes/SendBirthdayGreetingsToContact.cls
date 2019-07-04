global class SendBirthdayGreetingsToContact implements Database.Batchable<sObject>, Schedulable {

   global Database.QueryLocator start(Database.BatchableContext BC){
      String sQuery = 'SELECT Id, Name, Email FROM Contact WHERE BirthDate = Today';
      return Database.getQueryLocator(sQuery);
   }

   global void execute(Database.BatchableContext BC, List<Contact> lstContact){
       
         BirthdayGreetingsBatchHandler oBirthdayGreetingsBatchHandler = new BirthdayGreetingsBatchHandler();
         boolean bMailSent = oBirthdayGreetingsBatchHandler.sendBirthDayGreetingsToContacts(lstContact);
         if(!bMailSent)
         {
             //handle mail failure logic
         }
   }

   global void finish(Database.BatchableContext BC){
        // Get the ID of the AsyncApexJob representing this batch job
        // from Database.BatchableContext.
        // Query the AsyncApexJob object to retrieve the current job's information.
        AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
          TotalJobItems, CreatedBy.Email
          FROM AsyncApexJob WHERE Id =
          :BC.getJobId()];
        
        String sBody = 'The batch Apex job processed ' + a.TotalJobItems + ' batches with ' + a.NumberOfErrors + ' failures.';
        BirthdayGreetingsBatchHandler oBirthdayGreetingsBatchHandler = new BirthdayGreetingsBatchHandler();
        
        Messaging.SingleEmailMessage oMail = oBirthdayGreetingsBatchHandler.createEmailMessage(a.CreatedBy.Email, 'Apex Sharing Recalculation ' + a.Status, sBody);
        // Send an email to the Apex job's submitter notifying of job completion. 
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { oMail });
   }
   
   global void execute(SchedulableContext oSchedulableContext)
   {
       SendBirthdayGreetingsToContact oSendBirthdayGreetingsToContact = new SendBirthdayGreetingsToContact();    
   }
}
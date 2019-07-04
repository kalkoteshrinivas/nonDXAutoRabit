global class SummarizeAccountTotal implements 
    Database.Batchable<Account>, Database.Stateful{


   global Iterable<Account> start(Database.BatchableContext BC){
      return [SELECT Id FROM Account];
   }
   
   global void execute(
                Database.BatchableContext BC, 
                List<Account> scope){
      for(sObject s : scope){
         system.debug('debug::' + s.Id);
      }
   }

global void finish(Database.BatchableContext BC){
   }
}
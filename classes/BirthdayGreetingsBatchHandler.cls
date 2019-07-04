public class BirthdayGreetingsBatchHandler{
    
    public boolean sendBirthDayGreetingsToContacts(List<Contact> lstContact)
    {
        Messaging.SingleEmailMessage oSingleEmailMessage;
        List<Messaging.SingleEmailMessage> lstEmailMessage = new List<Messaging.SingleEmailMessage>();
        String sBody = ' ,Infosys technology limited wishes you very happy birthday. God bless you!! ';
        String sName;
        for(Contact oContact: lstContact)
        {
            sName = oContact.Name;
            oSingleEmailMessage = createEmailMessage(oContact.Email, sName + ' Happy Birthday!!', 'Dear '+ sName + sBody);
            lstEmailMessage.add(oSingleEmailMessage);
        }
        try{
        
            Messaging.sendEmail( lstEmailMessage );
            return true;
        }catch(Exception oException)
        {
            return false;
        }
    }
    
    public Messaging.SingleEmailMessage createEmailMessage(String sToAddresses, String sSubject, String sBody)
    {
       Messaging.SingleEmailMessage oMail = new Messaging.SingleEmailMessage();
       String[] lstEmails = new String[] {sToAddresses};
       oMail.setToAddresses(lstEmails);
       oMail.setSubject(sSubject);
       oMail.setPlainTextBody(sBody);
       return oMail;
    }
}
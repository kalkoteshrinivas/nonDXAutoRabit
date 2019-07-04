//This class is a externally exposed webService class. Which will help in various Account related functionality
global class AccountWebService
{
    //Create a new Account Based on name and Phone Number
    webservice static id createAccount(String name, String phoneNumber)
    {
        Account a=new Account(name=name,phone=phoneNumber);
        insert a;
        
        return a.id;
    }
    
    //Search Accounts and Return List
    
    webservice static List<Account> searchAccount(String name, String phoneNumber, String accountNumber)
    {
      String query='Select id,name,phone,accountNumber from account where ';
      
      if(name!=null)
      {
          query+='name=:name';
      }
      
      if(phoneNumber!=null)
      {
          query+='phone=:phoneNumber'; 
      }    
      
      if(accountNumber!=null)
      {
          query+='accountNumber=:accountNumber';
      }
      
      List<Account> lstAccount=Database.query(query);
      
          
     return lstAccount; 
    }
    
}
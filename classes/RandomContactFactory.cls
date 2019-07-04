public class RandomContactFactory{
    
    public static final String CONST_FIRST_NAME = 'Test';
    
    public static List<Contact> generateRandomContacts(Integer iNumOfContact, String sLastName)
    {
        List<Contact> lstRandomContact = new List<Contact>();
        for(Integer i = 0; i < iNumOfContact; i++)
        {
            lstRandomContact.add(new Contact(FirstName = CONST_FIRST_NAME + i, LastName = sLastName));
        }
        return lstRandomContact;
    }
    
}
public class PublicPageForSiteController{
public blob blobData{get; set;}

    
    public PublicPageForSiteController()
    {
    
    }
    
    public void saveFile()
    {
        Account oAccount = [SELECT Id From Account Where id =: '0019000000YSOkT'];
        Attachment oAtt = new Attachment(ParentId = oAccount.Id, Body = blobData, Name = 'TempFile');
        insert oAtt;
    }
}
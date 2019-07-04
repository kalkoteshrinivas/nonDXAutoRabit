global class testsoapapi
{
    
    webservice static ServiceWrapper getServiceWrapper()
    {
        Contact oCon = [SELECT Id, AccountId FROM Contact limit 1];
        ServiceWrapper oServiceWrapper = new ServiceWrapper();
        oServiceWrapper.AccId = oCon.AccountId;
        oServiceWrapper.ConId = oCon.Id;
        return oServiceWrapper;    
    }
    
    global class ServiceWrapper
    {
        webservice Id AccId;
        webservice Id ConId;
    }
    
}
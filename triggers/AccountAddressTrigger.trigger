trigger AccountAddressTrigger on Account (before insert, before update) {
    
    
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Account oAccount: (List<Account>)Trigger.new)
        {    
            if(oAccount.Match_Billing_Address__c)
            {
                oAccount.ShippingPostalCode = oAccount.BillingPostalCode;
            }
        }
    }
}
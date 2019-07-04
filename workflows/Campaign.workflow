<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AAkPay__Statement_Processing_Complete_Email_Notification</fullName>
        <description>Statement Processing Complete Email Notification</description>
        <protected>false</protected>
        <recipients>
            <field>LastModifiedById</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>AAkPay__AAKPay/AAkPay__Statement_Process_Update</template>
    </alerts>
    <fieldUpdates>
        <fullName>AAkPay__Set_Campaign_Create_URL_Token</fullName>
        <description>Set Create Contact URL Token To TRUE so that the URL Token generation is triggered</description>
        <field>AAkPay__Create_URL_Token__c</field>
        <literalValue>1</literalValue>
        <name>Set Campaign Create URL Token</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAkPay__Campaign Statement Generation%2FEmail out processing complete notification</fullName>
        <actions>
            <name>AAkPay__Statement_Processing_Complete_Email_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>AND(   NOT(ISBLANK( TEXT(AAkPay__Statement_Status__c ))),   ISCHANGED(AAkPay__Statement_Status__c ) )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>AAkPay__Create Campaign URL Token</fullName>
        <actions>
            <name>AAkPay__Set_Campaign_Create_URL_Token</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Campaign.AAkPay__Create_URL_Token__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Create URL Checkbox to trigger creation of a related URL Token.
Update the filter parameters for this workflow to selectively create these.
URL Tokens are used for creating object specific targeted payment requests.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>

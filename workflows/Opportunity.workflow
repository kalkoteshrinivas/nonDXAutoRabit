<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AAkPay__Set_Opportunity_Create_URL_Token</fullName>
        <description>Set Create Contact URL Token To TRUE so that the URL Token generation is triggered</description>
        <field>AAkPay__Create_URL_Token__c</field>
        <literalValue>1</literalValue>
        <name>Set  Opportunity Create URL Token</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAkPay__Create Opportunity URL Token</fullName>
        <actions>
            <name>AAkPay__Set_Opportunity_Create_URL_Token</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.AAkPay__Create_URL_Token__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Create URL Checkbox to trigger creation of a related URL Token.
Update the filter parameters for this workflow to selectively create these.
URL Tokens are used for creating object specific targeted payment requests.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>

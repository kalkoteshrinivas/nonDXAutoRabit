<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AAkPay__Set_Contact_Create_URL_Token</fullName>
        <description>Set Create Contact URL Token To TRUE so that the URL Token generation is triggered</description>
        <field>AAkPay__Create_URL_Token__c</field>
        <literalValue>1</literalValue>
        <name>Set Contact Create URL Token</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AAkPay__Set_Contact_Update_Geocode_to_true</fullName>
        <description>This will set the geocode update checkbox to true</description>
        <field>AAkPay__Update_Geocode__c</field>
        <literalValue>1</literalValue>
        <name>Set Contact Update Geocode to true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAkPay__Create Contact URL Token</fullName>
        <actions>
            <name>AAkPay__Set_Contact_Create_URL_Token</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Contact.AAkPay__Create_URL_Token__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Create URL Checkbox to trigger creation of a related URL Token.
Update the filter parameters for this workflow to selectively create these.
URL Tokens are used for creating object specific targeted payment requests.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AAkPay__Set Contact Update Geocode</fullName>
        <actions>
            <name>AAkPay__Set_Contact_Update_Geocode_to_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.AAkPay__Update_Geocode__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>This sets the checkbox for the geocoding. If true then the geocoding will run</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AAkPay__Set_Account_Contact_URL_Token</fullName>
        <description>Set Create Contact URL Token To TRUE so that the URL Token generation is triggered</description>
        <field>AAkPay__Create_URL_Token__c</field>
        <literalValue>1</literalValue>
        <name>Set Account Create URL Token</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>AAkPay__Set_Account_Update_Geocode</fullName>
        <field>AAkPay__Update_Geocode__c</field>
        <literalValue>1</literalValue>
        <name>Set Account Update Geocode</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_To_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Update To Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>SK</fullName>
        <apiVersion>29.0</apiVersion>
        <endpointUrl>http://www.google.com</endpointUrl>
        <fields>Id</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>kalkoteshrinivas@self.com</integrationUser>
        <name>SK</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>AAkPay__Create Account URL Token</fullName>
        <actions>
            <name>AAkPay__Set_Account_Contact_URL_Token</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.AAkPay__Create_URL_Token__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Create URL Checkbox to trigger creation of a related URL Token.
Update the filter parameters for this workflow to selectively create these.
URL Tokens are used for creating object specific targeted payment requests.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AAkPay__Set Account Update Geocode</fullName>
        <actions>
            <name>AAkPay__Set_Account_Update_Geocode</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.AAkPay__Update_Geocode__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>This sets the checkbox for the geocoding. If true then the geocoding will run</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Status to draft</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>SK</name>
                <type>OutboundMessage</type>
            </actions>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Hours</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Update Account To Prospe t</fullName>
        <actions>
            <name>Update_To_Prospect</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

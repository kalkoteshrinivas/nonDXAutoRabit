<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>AAkPay__Set_Lead_Update_Geocode_to_true</fullName>
        <description>This will set the geocode update checkbox to true</description>
        <field>AAkPay__Update_Geocode__c</field>
        <literalValue>1</literalValue>
        <name>Set Lead Update Geocode to true</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAkPay__Set Lead Update Geocode</fullName>
        <actions>
            <name>AAkPay__Set_Lead_Update_Geocode_to_true</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.AAkPay__Update_Geocode__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>This sets the checkbox for the geocoding. If true then the geocoding will run.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

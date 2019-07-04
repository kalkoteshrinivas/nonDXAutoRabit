<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>SEND_EMAIL_TO_PARENT</fullName>
        <description>SEND EMAIL TO PARENT</description>
        <protected>false</protected>
        <recipients>
            <field>PARENT_EMAIL__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Failure_Alert</template>
    </alerts>
    <rules>
        <fullName>FAILURE ALERT</fullName>
        <actions>
            <name>SEND_EMAIL_TO_PARENT</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Student__c.OVERALL_PERCENTAGE__c</field>
            <operation>lessThan</operation>
            <value>40</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

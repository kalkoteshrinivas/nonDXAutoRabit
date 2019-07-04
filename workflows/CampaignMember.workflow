<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>AAkPay__Send_Annual_Statement</fullName>
        <description>Send Annual Statement</description>
        <protected>false</protected>
        <recipients>
            <field>AAkPay__Print_Email_Receipt__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>AAkPay__AAKPay/AAkPay__Mass_Annual_Statement</template>
    </alerts>
    <fieldUpdates>
        <fullName>AAkPay__Set_CampaignMember_Create_URL_Token</fullName>
        <description>Set Create Contact URL Token To TRUE so that the URL Token generation is triggered</description>
        <field>AAkPay__Create_URL_Token__c</field>
        <literalValue>1</literalValue>
        <name>Set CampaignMember Create URL Token</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AAkPay__Create CampaignMember URL Token</fullName>
        <actions>
            <name>AAkPay__Set_CampaignMember_Create_URL_Token</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>CampaignMember.AAkPay__Create_URL_Token__c</field>
            <operation>notEqual</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sets Create URL Checkbox to trigger creation of a related URL Token.
Update the filter parameters for this workflow to selectively create these.
URL Tokens are used for creating object specific targeted payment requests.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>AAkPay__Send Annual Statement</fullName>
        <actions>
            <name>AAkPay__Send_Annual_Statement</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CampaignMember.Status</field>
            <operation>equals</operation>
            <value>Statement Send</value>
        </criteriaItems>
        <description>Is triggered by the Annual Statement Send button on the Campaign.
Sends the Visualforce Mass Annual Statement Email when the status is changed to Statement Send</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>

public class StudentReportController {
public Map<String,List<Marks__c>> mapOfMarks{get;set;}

public StudentReportController(){
mapOfMarks = new Map<String,List<Marks__c>>();
for(Marks__c m : [SELECT Id,Marks_Obtained__c,Maximum_Marks__c,Subject_Name__c,Student__r.Name FROM Marks__c]){
List<Marks__c> l = mapOfMarks.get(m.Student__r.Name);
if(l==null)
l = new List<Marks__c>();
l.add(m);
mapOfMarks.put(m.Student__r.Name,l);
}
}
}
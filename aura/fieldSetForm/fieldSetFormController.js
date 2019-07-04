({
    doInit : function(component, event, helper) {
        var action = component.get("c.getFields");
        var objectApiName = component.get("v.objectApiName");
        var fsName = component.get("v.fieldSetName");
        action.setParams({typeName: objectApiName, fsName: fsName});
        action.setCallback(this, function(a) {
            var fields = a.getReturnValue();
            component.set("v.fields", fields);
        });
        $A.enqueueAction(action);        
    },
    fireRefreshView : function(component, event, helper) {
         $A.get('e.force:refreshView').fire();
    }
})
({
  launchFlow: function (component) {
    component.set("v.showFlow", true);
    var flow = component.find("movieFlow");
    flow.startFlow("Movie_Request");
  },

  handleStatusChange: function (component, event, helper) {
    if (event.getParam("status") === "FINISHED") {
      helper.showSuccessToast(component, event);
      helper.closeRequestFlow(component, event);
    } else if (event.getParam("status") === "ERROR") {
      helper.showErrorToast(component, event);
      helper.closeRequestFlow(component, event);
    }
  }
});

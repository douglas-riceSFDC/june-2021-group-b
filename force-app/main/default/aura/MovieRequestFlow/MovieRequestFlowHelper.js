({
  showSuccessToast: function (component, event) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
      title: "Success!",
      message: "Your request has been added.",
      type: "success"
    });
    toastEvent.fire();
  },

  showErrorToast: function (component, event) {
    var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
      title: "Error!",
      message: "Your request had an error.",
      type: "error"
    });
    toastEvent.fire();
  },

  closeRequestFlow: function (component, event) {
    component.set("v.showFlow", false);
  }
});

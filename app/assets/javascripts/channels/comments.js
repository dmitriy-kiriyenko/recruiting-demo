App.messages = App.cable.subscriptions.create('CommentsChannel', {

  received: function(data) {
    toastr.success(data.message, 'New Comment:')
  }

});

Devour.Views.MessagesIndex = Backbone.View.extend({

  initialize: function(options) {
    this.collection = new Devour.Collections.Messages();
    this.listenTo(this.collection,'sync', this.render);
    this.collection.fetch();
  },

  template: JST['message/index'],

  render: function() {
    this.$el.html(this.template({
      received_messages: this.collection.receivedMessages(),
      sent_messages: this.collection.sentMessages()
      }));
    return this;
  },
});

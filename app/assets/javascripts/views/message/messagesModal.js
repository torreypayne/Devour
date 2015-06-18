Devour.Views.MessagesModal = Backbone.View.extend({

  initialize: function(options) {
    this.collection = new Devour.Collections.Messages();
    this.listenTo(this.collection,'sync', this.render);
    this.collection.fetch();
  },

  template: JST['message/messageModal'],

  render: function() {
    this.$el.html(this.template({ messages: this.collection.receivedMessages() }));
    return this;
  },

});

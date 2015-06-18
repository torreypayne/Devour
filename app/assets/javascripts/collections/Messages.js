Devour.Collections.Messages = Backbone.Collection.extend({

  url: 'api/messages',

  model: Devour.Models.Message,

  parse: function(response) {
    if (response.messages) {
      this.receivedMessages().set(response.messages.received);
      this.sentMessages().set(response.messages.sent);
      delete response.messages;
    }
    return response;
  },

  receivedMessages: function() {
    if (!this._received_messages) {
      this._received_messages = new Devour.Collections.Messages();
    }
    return this._received_messages;
  },

  sentMessages: function() {
    if (!this._sent_messages) {
      this._sent_messages = new Devour.Collections.Messages();
    }
    return this._sent_messages;
  },

});

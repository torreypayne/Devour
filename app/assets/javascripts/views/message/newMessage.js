Devour.Views.NewMessage = Backbone.View.extend({

  initialize: function(options) {
    this.receiver = options.receiver;
    this.listenTo(this.model, 'sync', this.render);
  },

  template: JST['message/new'],

  events: {
    'submit form':'submit',
  },

  render: function() {
    this.$el.html(this.template({ receiver: this.receiver }));
    return this;
  },

  submit: function(event) {
    var data = $(event.currentTarget).serializeJSON();
    var message = new Devour.Models.Message(data);
    message.save({}, {
      success: function() {
        Backbone.history.navigate('', { trigger: true });
      }
    });
  },

});

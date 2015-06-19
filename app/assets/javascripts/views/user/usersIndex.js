Devour.Views.UsersIndex = Backbone.View.extend({


  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render);
    this.collection.fetch();
  },

  events: {
    'click a.create-message':'writeMessage',
  },

  template: JST['user/index'],

  render: function() {
    this.$el.html(this.template({ users: this.collection }));
    return this;
  },

  writeMessage: function(event) {
    event.preventDefault();
    var receiver = $(event.currentTarget).data('id');
    var newMessage = new Devour.Views.NewMessage({ receiver: receiver });
    $(event.currentTarget).parent().append(newMessage.render().$el);
  },


});

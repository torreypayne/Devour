Devour.Views.SubForm = Backbone.View.extend({

  initialize: function(options) {

  },

  events: {
    'submit form':'submit',
  },

  template: JST['forum/forumForm'],

  render: function() {
    this.$el.html(this.template({ sub: this.model }));
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var form = this;
    var data = $(event.currentTarget).serializeJSON();
    var sub = new Devour.Models.Subforum(data);
    sub.save({}, {
      success: function() {
        Backbone.history.navigate('#/forum');
      }
    });
  },

});

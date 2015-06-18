Devour.Views.UsersIndex = Backbone.View.extend({


  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render);
    this.collection.fetch();
  },

  template: JST['user/index'],

  render: function() {
    this.$el.html(this.template({ users: this.collection }));
    return this;
  },


});

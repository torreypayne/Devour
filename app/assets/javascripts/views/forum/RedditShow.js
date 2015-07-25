Devour.Views.RedditShow = Backbone.View.extend({

  template: JST['reddit/RedditShow'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
    this.model.fetch();
  },

  render: function() {
    this.$el.html(this.template({ model: this.model }));
    console.log(this.model);
    return this;
  },

});

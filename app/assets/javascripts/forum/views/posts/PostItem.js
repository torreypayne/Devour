Devour.Views.Post = Backbone.View.extend({

  template: JST['reddit/post/PostItem'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  },

});

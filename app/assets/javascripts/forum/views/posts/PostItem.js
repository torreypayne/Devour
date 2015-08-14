Devour.Views.PostItem = Backbone.View.extend({

  template: JST['reddit/post/PostItem'],

  tagName: 'tr',

  className: 'post',

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
    console.log(this.model);
  },

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  },

});

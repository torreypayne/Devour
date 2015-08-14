Devour.Views.CommentItem = Backbone.View.extend({
  template: JST['reddit/comment/commentItem'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function() {
    var content = this.template({ comment: this.model });
    this.$el.html(content);
    return this;
  },
});

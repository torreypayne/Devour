Devour.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['reddit/post/PostShow'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.model.comments().forEach(function(comment) {
      console.log(comment);
      var commentView = new Devour.Views.CommentItem({ model: comment });
      this.addSubview('.comments', commentView);
    }.bind(this));
    this.attachSubviews();
    return this;
  },
});

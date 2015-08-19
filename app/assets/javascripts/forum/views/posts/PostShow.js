Devour.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['reddit/post/PostShow'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.model.top_level_comments().forEach(function(top_level_comment) {
      // console.log(top_level_comment);
      // var commentModel = new Devour.Models.Comment({
      //   model: top_level_comment
      // });
      var commentView = new Devour.Views.CommentItem({
        model: top_level_comment,
       });
       console.log(commentView);
      this.addSubview('.comments', commentView);
    }.bind(this));
    this.attachSubviews();
    return this;
  },
});

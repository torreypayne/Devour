Devour.Views.PostShow = Backbone.CompositeView.extend({
  template: JST['forum/post/PostShow'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click a.leave-comment':'newComment'
  },

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    this.model.top_level_comments().sortBy(function(a) {
      return a.get('created_at');
    });
    this.model.top_level_comments().forEach(function(top_level_comment) {
      var commentView = new Devour.Views.CommentItem({
        model: top_level_comment,
       });
      this.addSubview('.comments', commentView);
    }.bind(this));
    // this.attachSubviews(); Only need to do this if I only add, not addSubview
    return this;
  },

  newComment: function(ev) {
    ev.preventDefault();
    var commentForm = new Devour.Views.CommentForm({
      post: this.model
    });
    this.$el.html(commentForm.render().$el);
  },

});

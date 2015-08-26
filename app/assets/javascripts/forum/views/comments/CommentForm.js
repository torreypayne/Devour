Devour.Views.CommentForm = Backbone.View.extend({

  initialize: function(options) {
    this.post = options.post;
    this.parent_comment = options.parent_comment;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'submit form':'submit'
  },

  template: JST['forum/comment/commentForm'],

  render: function() {
    this.$el.html(this.template({
      post: this.post,
      parent_comment: this.parent_comment
    }));
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    $data = $(event.currentTarget).serializeJSON();
    var comment = new Devour.Models.Comment($data);
    comment.save({}, {
      success: function(resp) {
        // this.render();
        Backbone.history.navigate('#/forum/posts/' + this.post.id, { trigger: true });
      }.bind(this),
      error: function(resp) {
        console.log('Unable to submit new comment!');
        console.log(resp);
      }
    })
  }


});

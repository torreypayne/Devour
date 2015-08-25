Devour.Views.PostForm = Backbone.View.extend({

  template: JST['reddit/post/postForm'],

  events: {
    'submit form':'submit'
  },

  initialize: function(options) {
    this.subs = options.subs;
  },

  render: function() {
    this.$el.html(this.template({
      subs: this.subs,
      post: this.model
    }));
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var $data = $(event.currentTarget).serializeJSON();
    var post = new Devour.Models.RedditPost($data);
    post.save({}, {
      success: function(resp) {
        Backbone.history.navigate('#/forum/posts' + post.id);
      },
      error: function(resp) {
        console.log(resp);
      }
    });
  }

});

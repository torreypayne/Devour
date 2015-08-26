Devour.Models.Subforum = Backbone.Model.extend({
    urlRoot: 'forum/subs',

    posts: function() {
        if (!this._posts) {
            this._posts = new Devour.Collections.forumPosts([], { sub: this });
        }
        return this._posts;
    },

    parse: function(response) {
      if (response.posts) {
        this.posts().set(response.posts);
        delete response.posts;
      }
      return response;
    },
});

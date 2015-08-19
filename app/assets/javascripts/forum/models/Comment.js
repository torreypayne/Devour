Devour.Models.Comment = Backbone.Model.extend({
    urlRoot: 'forum/comments',

    initialize: function(options) {
      this.post = options.post;
    },

    child_comments: function() {
      if (!this._child_comments) {
        this._child_comments = new Devour.Collections.Comments([], { post: this.post });
      }

      return this._child_comments;
    },

    parse: function(response) {
      if (response.comments_by_parent[this.id]) {
        this.child_comments().set(response.comments_by_parent[this.id]);
      }
      delete response.comments_by_parent[this.id];
      this.child_comments().forEach(function(child_comment) {
        child_comment.parse(response);
      });
      return response;
    },

});

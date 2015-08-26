Devour.Models.forumPost = Backbone.Model.extend({
    urlRoot: 'forum/posts',

    top_level_comments: function() {
      if (!this._top_level_comments) {
        this._top_level_comments = new Devour.Collections.Comments([], { post: this });
      }
      return this._top_level_comments;
    },

    parse: function(response) {
      if (response.comments_by_parent) {
        this.top_level_comments().set(response.comments_by_parent[""]);
        delete response.comments_by_parent[""];
      }
      this.top_level_comments().forEach(function(top_level_comment) {
        top_level_comment.parse(response);
      })
      // delete response.comments_by_parent;
      return response;
    },


});

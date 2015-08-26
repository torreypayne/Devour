Devour.Collections.Comments = Backbone.Collection.extend({
    url: 'forum/comments',

    model: Devour.Models.Comment,

    // comparator: function(comment) {
    //   return -comment.get('created_at');
    // },
});

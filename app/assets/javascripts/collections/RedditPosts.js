Devour.Collections.RedditPosts = Backbone.Collection.extend({
    url: 'api/posts',
    
    model: Devour.Models.RedditPost,
})
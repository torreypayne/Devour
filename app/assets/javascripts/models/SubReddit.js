Devour.Models.SubReddit = Backbone.Model.extend({
    urlRoot: 'api/subs',
    
    posts: function() {
        if (!this._posts) {
            this._posts = new Devour.Collections.Posts([], { sub: this });
        }
        return this._posts;
    },
});
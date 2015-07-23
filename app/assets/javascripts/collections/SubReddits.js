Devour.Collections.SubReddits = Backbone.Collection.extend({
    url: 'api/subs',
    
    model: Devour.Models.SubReddit,
    
    getOrFetch: function(id) {
        var collection = this;
        var subReddit = this.get(id);
        if (!subReddit) {
            subReddit.fetch();
        } else {
            subReddit = new Devour.Models.SubReddit({ id: id });
            subReddit.fetch({
                success: function() {
                    collection.add(subReddit);
                }
            });
        }
        return subReddit;
    }
})
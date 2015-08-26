Devour.Collections.Subforums = Backbone.Collection.extend({
    url: 'forum/subs',

    model: Devour.Models.Subforum,

    getOrFetch: function(id) {
        var collection = this;
        var subforum = this.get(id);
        if (subforum) {
            subforum.fetch();
        } else {
            subforum = new Devour.Models.Subforum({ id: id });
            subforum.fetch({
                success: function() {
                    collection.add(subforum);
                }
            });
        }
        return subforum;
    }
})

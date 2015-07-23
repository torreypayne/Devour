Devour.Views.RedditIndex = Backbone.CompositeView.extend({
    
    template: JST['reddit/RedditIndex'],
    
    initialize: function(options) {
        this.listenTo(this.collection, 'sync', this.render);
        this.collection.fetch();
    },
    
    render: function() {
        this.$el.html(this.template({ forum: this.collection }));
        console.log(this.collection);
        return this;
    },
    
    
});
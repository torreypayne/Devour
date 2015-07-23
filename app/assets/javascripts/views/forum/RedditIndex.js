Devour.Views.RedditIndex = Backbone.CompositeView.extend({
    
    template: JST['reddit/RedditIndex'],
    
    initialize: function(options) {
        this.listenTo(this.collection, 'sync', this.render);
    },
    
    render: function() {
        this.$el.html(this.template({ forum: this.model }));
        return this;
    },
    
    
});
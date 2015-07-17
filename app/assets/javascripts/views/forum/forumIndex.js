Devour.Views.ForumIndex = Backbone.CompositeView.extend({
    
    template: JST['forum/forumIndex'],
    
    initialize: function(options) {
    },
    
    render: function() {
        this.$el.html(this.template({}));
        return this;
    }
    
    
});
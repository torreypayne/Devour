Devour.Views.RedditIndex = Backbone.CompositeView.extend({

    template: JST['reddit/RedditIndex'],

    events: {
      'click a.subreddit':'showSubreddit',
    },

    initialize: function(options) {
        this.listenTo(this.collection, 'sync', this.render);
        this.collection.fetch();
    },

    render: function() {
        console.log('rendered');
        this.$el.html(this.template({ forum: this.collection }));
        console.log(this.collection);
        return this;
    },

    showSubreddit: function(event) {
      var sub = $(event.currentTarget);
      var id = sub.data('id');
      var subView = new Devour.Views.RedditShow({ collection: this.collection });
      this.swapReddit(subView);
    },

    swapReddit: function(view) {
      if (this._currentView) {
        this.removeSubview(this._currentView);
      }
      this._currentView && this._currentView.remove();
      this_currentView = view;
      this.addSubView(this._currentView);
      this.render();
      return view;
    },


});

Devour.Views.RedditIndex = Backbone.CompositeView.extend({

    template: JST['reddit/RedditIndex'],

    events: {
      'click subreddit.a':'showSubreddit',
    },

    initialize: function(options) {
        this.listenTo(this.collection, 'sync', this.render);
        this.collection.fetch();
    },

    render: function() {
        if (this._currentView) {
          this.attachSubviews();
          this._currentView.render();
        } else {
          this.$el.html(this.template());
          var that = this;
          this.collection.each(function(subReddit) {
            var subView = new Devour.Views.RedditItem({ model: subReddit });
            that.addSubview('.subreddits', subView);
          });
          this.attachSubviews();
        }
        return this;
    },

    showSubreddit: function(event) {
      event.preventDefault();
      debugger;
      var sub = $(event.currentTarget);
      var id = sub.data('id');
      this.subReddit = this.collection.getOrFetch(id);
      var subView = new Devour.Views.RedditShow({
        model: this.subReddit,
        collection: this.collection
      });
      this.swapReddit(subView);
    },

    swapReddit: function(view) {
      this.removeSubviews();
      this._currentView && this._currentView.remove();
      this._currentView = view;
      this.addSubview('.forum-index', this._currentView);
      this.render();
    },


});

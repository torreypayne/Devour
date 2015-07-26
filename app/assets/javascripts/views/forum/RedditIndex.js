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
        if (this._currentView) {
          this.attachSubviews();
          // this._currentView.render();
        } else {
          this.$el.html(this.template({ forum: this.collection }));
          console.log(this.collection);
        }
        return this;
    },

    showSubreddit: function(event) {
      event.preventDefault();
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
      this._currentView && this._currentView.remove();
      this._currentView = view;
      this.addSubview('.forum-index', this._currentView);
      this.render();
    },


});

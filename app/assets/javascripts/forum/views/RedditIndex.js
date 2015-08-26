Devour.Views.forumIndex = Backbone.CompositeView.extend({

    template: JST['forum/forumIndex'],

    events: {
      'click subforum.a':'showSubforum',
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
          this.collection.each(function(subforum) {
            var subView = new Devour.Views.forumItem({ model: subforum });
            that.addSubview('.subforums', subView);
          });
          this.attachSubviews();
        }
        return this;
    },

    showSubforum: function(event) {
      event.preventDefault();
      debugger;
      var sub = $(event.currentTarget);
      var id = sub.data('id');
      this.subforum = this.collection.getOrFetch(id);
      var subView = new Devour.Views.forumShow({
        model: this.subforum,
        collection: this.collection
      });
      this.swapforum(subView);
    },

    swapforum: function(view) {
      this.removeSubviews();
      this._currentView && this._currentView.remove();
      this._currentView = view;
      this.addSubview('.forum-index', this._currentView);
      this.render();
    },


});

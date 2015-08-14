Devour.Views.RedditShow = Backbone.CompositeView.extend({

  template: JST['reddit/RedditShow'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
    this.model.fetch();
  },

  render: function() {
    this.$el.html(this.template({ model: this.model }));
    var subforumView = this;
    this.model.posts().forEach(function(post) {
      var postView = new Devour.Views.PostItem({ model: post });
      subforumView.addSubview(postView.render().$el);
    });
    this.attachSubviews();
    return this;
  },

});

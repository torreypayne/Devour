Devour.Views.DecksIndex = Backbone.View.extend({

  template: JST["deck/index"],

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function() {
    var indexViewer = this.template({ decks: this.collection });
    this.$el.html(indexViewer);
    return this;
  },

});

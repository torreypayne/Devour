Devour.Routers.MainRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = new Devour.Collections.Decks();
  },

  routes: {
    '':'index',
    'decks/new':'newDeck',
    'decks/:id/edit':'editDeck',
    'decks/:id':'showDeck'
  },

  index: function() {
    this.collection.fetch();
    var indexView = new Devour.Views.DecksIndex({ collection: this.collection });
    this.swapView(indexView);
  },

  newDeck: function() {
    var deck = new Devour.Models.Deck();
    var newView = new Devour.Views.DeckForm({
      model: deck,
      collection: this.collection,
    });
    this.swapView(newView);
  },

  edit: function(id) {
    var deck = this.collection.getOrFetch(id);
    var editView = new Devour.Views.DeckForm({
      model: deck,
      collection: this.collection,
    });
    this.swapView(editView);
  },

  show: function(id) {
    var deck = this.collection.getOrFetch(id);
    var showView = new Devour.Views.DeckShow({ model: deck });
    this.swapView(showView);
  },

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }

});

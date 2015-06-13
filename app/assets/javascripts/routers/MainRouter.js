Devour.Routers.MainRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.navbar = options.navbar;
    this.sidebar = options.sidebar;
    this.decks = options.collection;
  },

  routes: {
    '':'index',
    'decks/new':'newDeck',
    'decks/:id/edit':'editDeck',
    'decks/:id':'showDeck',
    'search':'search',
  },

  search: function() {
    var publicDecks = new Devour.Collections.PublicDecks();
    var searchView = new Devour.Views.Search({ collection: publicDecks });
    this.swapView(searchView);
  },

  index: function() {
    this.decks.fetch({
      success: function() {
        console.log(this.decks);
      }.bind(this)
    });
    var indexView = new Devour.Views.DecksIndex({ collection: this.decks });
    this.swapView(indexView);
  },

  newDeck: function() {
    var deck = new Devour.Models.Deck();
    var newView = new Devour.Views.DeckForm({
      model: deck,
      collection: this.decks,
    });
    this.swapView(newView);
  },

  edit: function(id) {
    var deck = this.decks.getOrFetch(id);
    var editView = new Devour.Views.DeckForm({
      model: deck,
      collection: this.decks,
    });
    this.swapView(editView);
  },

  showDeck: function(id) {
    var that = this;
    var deck = this.decks.getOrFetch(id);
    var showView = new Devour.Views.DeckShow({
      model: deck,
      collection: deck.cards()
    });
    this.swapView(showView);
  },

  swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  },
});

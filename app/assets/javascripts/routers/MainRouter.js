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
    'signOut':'signOut',
    'study':'study',
    'publicIndex':'publicDecks',
    'leaderboard':'showLeaders',
  },

  search: function() {
    var publicDecks = new Devour.Collections.PublicDecks();
    publicDecks.fetch({
      success: function() {
      var searchView = new Devour.Views.SearchView({ collection: publicDecks });
      this.swapView(searchView);
      }.bind(this)
    });
  },

  publicDecks: function() {
    var publicDecks = new Devour.Collections.PublicDecks();
    publicDecks.fetch({
      success: function() {
        var publicView = new Devour.Views.PublicIndex({ collection: publicDecks });
        this.swapView(publicView);
      }.bind(this)
    });
  },

  index: function() {
    this.decks.fetch({
      data: { page: 1 }
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

  signOut: function(event) {
    $.ajax({
      url: '/session',
      type: 'DELETE',
      success: function() {
        window.location = '/session/new';
      }
    });
  },

  study: function() {
    var quizView = new Devour.Views.QuizView({ collection: this.decks });
    this.swapView(quizView);
    publicDecks.fetch({
      success: function() {
        console.log("we're here");
        // $('li.study-dropdown').append(this.studyDropdown({decks: publicDecks }));
      }
    });
  },

  showLeaders: function() {
    var leaderboardView = new Devour.Views.LeaderboardIndex({
      model: new Devour.Models.Leaderboard
    });
    this.swapView(leaderboardView);
  },
});

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
    'decks/:id/new':'newCard',
    'decks/:id/edit':'editDeck',
    'decks/:id/data':'showDeckDetails',
    'decks/:id':'showDeck',
    'search':'search',
    'signOut':'signOut',
    'study':'study',
    'publicIndex':'publicDecks',
    'leaderboard':'showLeaders',
    'usersIndex':'userIndex',
    'messages':'messagesIndex',
    'forum':'forumIndex'
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

  showDeckDetails: function(id) {
    var deck = this.decks.getOrFetch(id);
    var deckData = new Devour.Views.DeckData({
      model: deck,
      collection: this.decks,
    });
    this.swapView(deckData);
  },

  study: function() {
    var quizView = new Devour.Views.QuizView({ collection: this.decks });
    this.swapView(quizView);
    // publicDecks.fetch({
    //   success: function() {
    //     console.log("we're here");
    //     // $('li.study-dropdown').append(this.studyDropdown({decks: publicDecks }));
    //   }
    // });
  },

  showLeaders: function() {
    var leaderboardView = new Devour.Views.LeaderboardIndex({
      model: new Devour.Models.Leaderboard
    });
    this.swapView(leaderboardView);
  },

  userIndex: function() {
    var usersIndexView = new Devour.Views.UsersIndex({
      collection: new Devour.Collections.Users()
    });
    this.swapView(usersIndexView);
  },

  messagesPreview: function() {
    var messageView = new Devour.Views.MessagesModal();
    this.swapView(messageView);
  },

  messagesIndex: function() {
    var messagesIndex = new Devour.Views.MessagesIndex();
    this.swapView(messagesIndex);
  },

  newCard: function(id) {
    var deck = this.decks.getOrFetch(id);
    this._currentCard = new Devour.Models.Card({ deck_id: deck.id });
    var view = new Devour.Views.CardForm({
      model: this._currentCard,
      deck: deck,
    });
    this.swapView(view);
  },
  
  forumIndex: function() {
    var reddit = new Devour.Views.RedditIndex({
      collection: new Devour.Collections.SubReddits
    });
    var redditView = new Devour.Views.RedditIndex({});
    this.swapView(redditView);
  },

});

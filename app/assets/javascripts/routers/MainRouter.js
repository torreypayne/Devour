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
    'forum':'forumIndex',
    'forum/:id':'showSubforum',
    'forum/posts/new':'newPost',
    'forum/posts/:id':'showPost',
    'forum/subs/new':'newSub',
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
    this.subforums = new Devour.Collections.Subforums();
    var forumView = new Devour.Views.forumIndex({
      collection: this.subforums
    });
    this.swapView(forumView);
  },

  showSubforum: function(id) {
    if (!this.subforums) {
      this.subforums = new Devour.Collections.Subforums();
    }
    var subforum = this.subforums.getOrFetch(id);
    var subView = new Devour.Views.forumShow({
      model: subforum,
      collection: this.subforums
    });
    this.swapView(subView);
  },

  showPost: function(id) {
    var post = new Devour.Models.forumPost({ id: id });
    post.fetch({
      success: function() {
        var postView = new Devour.Views.PostShow({
          model: post
        });
        this.swapView(postView);
      }.bind(this)
    });
  },

  newSub: function() {
    var form = new Devour.Views.SubForm();
    this.swapView(form);
  },

  newPost: function() {
    var subs = new Devour.Collections.Subforums();
    subs.fetch({
      success: function(resp) {
        var form = new Devour.Views.PostForm({
          subs: subs
        });
        this.swapView(form);
      }.bind(this)
    });
  }

});

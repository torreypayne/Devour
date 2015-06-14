Devour.Views.SearchView = Backbone.View.extend({

  template: JST['search/search'],

  resultsTemplate: JST['search/results'],

  events: {
    'keyup #search-by-title':'filterDecks',
    'click button.btn-success':'shareDeck',
  },


  initialize: function(options) {
    this.chars = "";
  },

  render: function() {
    this.$el.html(this.template({ decks: this.collection }));
  },

  filterDecks: function(event) {
    var data = $(event.currentTarget).serializeJSON();
    var chars = data.title.toLowerCase();
    var matched = [];
    this.collection.each(function(deck) {
      if (deck.get('title').toLowerCase().includes(chars)) {
        matched.push(deck);
      }
    });
    this.collection.set(matched);
    $('ul.deck-list').html(this.resultsTemplate({ decks: this.collection }));
  },

  shareDeck: function() {
    var deckId = $(event.target).data('deck-id');
    var userId = $('#current-user').data('id');
    var shareOfDeck = new Devour.Models.DeckShare({
      deck_id: deckId,
      user_id: userId,
    });
    shareOfDeck.save({}, {
      success: function() {
        Backbone.history.navigate('', { trigger: true });
      }.bind(this)
    });

  },


});

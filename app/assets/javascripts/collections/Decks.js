Devour.Collections.Decks = Backbone.Collection.extend({

  model: Devour.Models.Deck,

  url: '/api/decks',

  getOrFetch: function(id) {
    var collection = this;
    var deck = this.get(id);
    if (deck) {
      deck.fetch();
    } else {
      deck = new Devour.Models.Deck({ id: id });
      deck.fetch({
        success: function() {
          console.log(deck);
          collection.add(deck);
        }
      });
    }
    return deck;
  },
});


// Devour.Collections.decks = new Devour.Collections.Decks;

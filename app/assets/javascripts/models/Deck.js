Devour.Models.Deck = Backbone.Model.extend({

  urlRoot: 'api/decks',

  cards: function() {
    if (!this._cards) {
      this._cards = new Devour.Collections.Cards([], { deck: this });
    }
    return this._cards;
  },

  parse: function(response) {
    if (response.cards) {
      this.cards().set(response.cards);
      // delete response.cards;
    }
    return response;
  }

});

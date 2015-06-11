Devour.Models.Deck = Backbone.Model.extend({

  urlRoot: 'api/decks',

  cards: function() {
    if (!this._cards) {
      this._cards = new Devour.Collections.Cards();
    }
    return this._cards;
  },

});

Devour.Models.Deck = Backbone.Model.extend({

  urlRoot: 'api/decks',

  cards: function() {
    if (!this._cards) {
      this._cards = new Devour.Collections.Cards([], { deck: this });
    }
    return this._cards;
  },

  reviewCards: function() {
    if (!this._reviewCards) {
      this._reviewCards = new Devour.Collections.Cards([], { deck: this });
    }
    return this._reviewCards;
  },



  parse: function(response) {
    if (response.cards) {
      this.cards().set(response.cards);
      delete response.cards;
    }
    if (response.review_cards) {
      this.reviewCards().set(response.review_cards);
      delete response.review_cards;
    }
    return response;
  }

});

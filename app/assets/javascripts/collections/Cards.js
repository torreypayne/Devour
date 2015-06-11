Devour.Collections.Cards = Backbone.Collection.extend({

  url: 'api/cards',

  model: Devour.Models.Card,

  comparator: function(card) {
    return card.get('last_passed');
  },

  getOrFetch: function(id) {
    var collection = this;
    var card = this.get(id);
    if (card) {
      card = new Devour.Models.Card({ id: id });
      card.fetch({
        success: function() {
          collection.add(card);
        }
      });
      return card;
    }
  }

});

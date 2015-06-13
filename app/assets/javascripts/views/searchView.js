Devour.Views.SearchView = Backbone.View.extend({

  template: JST['search'],

  events: {
    'keyup #search-by-title':'filterDecks',
  },


  initialize: function(options) {
    this.chars = "";
  },

  render: function() {
    this.$el.html(this.template({ decks: this.collection }));
  },

  filterDecks: function(event) {
    var data = $(event.currentTarget).serializeJSON();
    this.chars = data.get('title');
    var matched = [];
    this.collection.each(function(deck) {
      if (deck.title.contains(this.chars)) {
        matched.push(deck);
      }
    });
    return matched;
  },


});

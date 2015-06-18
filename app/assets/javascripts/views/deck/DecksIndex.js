Devour.Views.DecksIndex = Backbone.View.extend({

  intro: JST["deck/intro"],

  template: JST["deck/index"],

  events: {
    'click button.btn-success':'study',
    'click button.btn-danger':'deleteDeck',
    'scroll':'addDecks',
  },

  initialize: function(options) {
    this.page = 1;
    this.$el.append(this.intro);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    // Need to overwrite the fetch method for Deck collections I believe
    var indexViewer = this.template({ decks: this.collection });
    this.$el.html(indexViewer);
    return this;
  },

  addDecks: function() {
    this.page += 1;
    this.collection.fetch({
      data: { page: this.page }
    });
  },

  study: function(event) {
    var data = $(event.currentTarget).data('deck-id');
    Backbone.history.navigate('decks/' + data, { trigger: true });
  },

  deleteDeck: function() {
    var deck = this.collection.get($(event.target).data('deck-id'));
    deck.destroy();
    this.collection.fetch();
  },

});

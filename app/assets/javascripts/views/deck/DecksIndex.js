Devour.Views.DecksIndex = Backbone.View.extend({

  template: JST["deck/index"],

  events: {
    'click button.btn-success':'study',
    'click button.btn-danger':'deleteDeck'
  },

  initialize: function(options) {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var indexViewer = this.template({ decks: this.collection });
    this.$el.html(indexViewer);
    return this;
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

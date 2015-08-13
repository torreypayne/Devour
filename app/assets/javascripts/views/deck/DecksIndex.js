Devour.Views.DecksIndex = Backbone.View.extend({

  intro: JST["deck/intro"],

  template: JST["deck/index"],

  events: {
    'click button.add-card':'newCard',
    'click button.btn-success':'study',
    'click button.show-data':'showData',
    'click button#data-options':'showData',
    'click button.btn-danger':'deleteDeckShare',
    'click button#guide':'publicDirectory',
    'click button.public-list':'publicDirectory',
    'click a.public-list':'publicDirectory',
  },

  initialize: function(options) {
    this.page = 1;
    this.$el.append(this.intro);
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function() {
    var currentUser = $('#current-user').data('id');
    var indexViewer = this.template({
      decks: this.collection,
      currentUser: currentUser
    });
    var mainView = this;
    this.$el.html(indexViewer);
    this.collection.each(function(deck) {
      var subView = new Devour.Views.DeckItem({ model: deck });
      mainView.$el.append(subView.render().$el);
    });
    return this;
  },

  study: function(event) {
    var data = $(event.currentTarget).data('deck-id');
    Backbone.history.navigate('decks/' + data, { trigger: true });
  },

  showData: function(event) {
    var deck = $(event.currentTarget).data('deck-id');
    Backbone.history.navigate('decks/' + data + '/details', { trigger: true });
  },

  deleteDeck: function() {
    var deck = this.collection.get($(event.target).data('deck-id'));
    deck.destroy();
    this.collection.fetch();
  },

  newCard: function() {
    event.preventDefault();
    var data = $(event.target).data('deck-id');
    Backbone.history.navigate('decks/' + data + '/new', { trigger: true });
  },

  publicDirectory: function() {
    event.preventDefault();
    Backbone.history.navigate('publicIndex', { trigger: true });
  },

});

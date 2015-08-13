Devour.Views.PublicIndex = Backbone.View.extend({

  initialize: function(options) {

  },

  template: JST['deck/publicIndex'],

  events: {
    'click button.btn-default':'createDeckShare'
  },

  render: function() {
    this.$el.html(this.template());
    var mainView = this;
    this.collection.each(function(deck) {
      var subView = new Devour.Views.PublicDeckItem({ model: deck });
      mainView.$('form.list-group').append(subView.render().$el);
    });
    return this;
  },

  createDeckShare: function(event) {
    event.preventDefault();
    var deck_id = $(event.currentTarget).data('deck-id');
    var currentUser = $('#current-user').data('id');
    var deckShare = new Devour.Models.DeckShare({
      deck_id: deck_id,
      user_id: currentUser
    });
    deckShare.save({}, {
      success: function() {
        console.log("Deck shared!");
        Backbone.history.navigate('', { trigger: true });
      },
      error: function() {
        console.log("Deck not shared.");
      }
    });
  },

});

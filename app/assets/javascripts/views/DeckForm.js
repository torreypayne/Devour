Devour.Views.DeckForm = Backbone.View.extend({

  template: JST["deck/form"],

  // initialize: function(options) {
  //
  // },

  events: {
    'submit form':'submit'
  },

  render: function() {
    var formView = this.template({ deck: this.model });
  },

  submit: function() {
    var formView = this;
    var $target = $(event.currentTarget).serializeJSON();
    var deck = new Devour.Models.Deck($target);
    deck.save({}, {
      success: function() {
        formView.collection.add(deck, { merge: true });
        Backbone.history.navigate('', { trigger: true });
      }
    });
  }

});

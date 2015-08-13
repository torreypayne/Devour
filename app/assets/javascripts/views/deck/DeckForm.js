Devour.Views.DeckForm = Backbone.View.extend({

  template: JST["deck/form"],

  events: {
    'submit form':'submit'
  },

  render: function() {
    var formView = this.template({ deck: this.model });
    this.$el.html(formView);
    return this;
  },

  submit: function() {
    event.preventDefault();
    var formView = this;
    var $target = $('#deck-form').serializeJSON();
    var deck = new Devour.Models.Deck($target);
    deck.save({}, {
      success: function() {
        formView.collection.add(deck, { merge: true });
        Backbone.history.navigate('', { trigger: true });
      }
    });
  }

});

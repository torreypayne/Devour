Devour.Views.CardForm = Backbone.View.extend({

  initialize: function(options) {
    this.deck = options.deck;
    var form = this;
    // this.on('keydown', function(event) {
    //   if (event.which == 13) {
    //     form.submit();
    //   }
    // });
  },

  events: {
    'submit form':'submit'
  },

  template: JST['card/form'],

  errorTemplate: JST['card/error'],

  render: function() {
    this.$el.html(this.template({ card: this.model }));
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var cardForm = this;
    var cardData = $(event.currentTarget).serializeJSON();
    var card = new Devour.Models.Card(cardData);
    card.save({}, {
      success: function(data) {
        if (data.errors) {

        }
        cardForm.deck.cards().add(card);
        cardForm.render();
      },
      error: function(response) {
        $('div.has-error').append($('<p>').text(response));
      }
    });

  }

});

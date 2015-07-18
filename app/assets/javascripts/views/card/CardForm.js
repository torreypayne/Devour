Devour.Views.CardForm = Backbone.View.extend({

  initialize: function(options) {
    this.deck = options.deck;
    this.collection = new Devour.Collections.Cards();
    this.deckView = options.deckView;
  },

  events: {
    'click .one-sided, .two-sided': 'toggle',
    'submit form':'submit',
  },

  toggle: function (attribute) {
    this.oneSided = !this.oneSided;
  },

  template: JST['card/form'],

  errorTemplate: JST['card/error'],

  render: function() {
    this.$el.html(this.template({ card: this.model, oneSided: this.oneSided }));
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var cardForm = this;
    var cardData = $(event.currentTarget).serializeJSON();
    var cardId = $('#card-id').data('card-id');
    var card;
    if (cardId) {
      this.model.save(cardData, {
        success: function(data) {
          this.deckView.resetCards();
          // window.history.back();
        }.bind(this)
      });
    } else {
      card = new Devour.Models.Card(cardData);
      card.save({}, {
        success: function(data) {
          cardForm.deck.cards().add(card);
          if ($('.two-sided').hasClass('btn-primary')) {
            var newQuestion = cardData.card.answer;
            var newAnswer = cardData.card.question;
            var otherSide = new Devour.Models.Card({
              question: newQuestion,
              answer: newAnswer,
              deck_id: cardData.card.deck_id
            });
            otherSide.save({});
          }
          cardForm.render();
        },
        error: function(response) {
          $('div.has-error').append($('<p>').text(response));
        }
      });
    }
  },


});

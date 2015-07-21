Devour.Views.CardShow = Backbone.CompositeView.extend({

  template: JST['card/show'],

  answerTemplate: JST['card/answer'],

  className: "card-item",

  events: {
    'click button.answer-button':'assessResponse',
    'click button.btn-reveal':'revealAnswer',
    'keydown':'keyAction',
  },

  initialize: function(options) {
    this.deck = options.deck;
    this.listenTo(this.model, 'sync', this.render);
    // $(document).on('keydown', this.keyAction.bind(this));
  },

  render: function() {
    var question = this.template({ card: this.model });
    this.$el.html(question);
    return this;
  },
  
  // keyAction: function(event) {
  //   // debugger;
  //   event.preventDefault();
  //   var key = event.keyCode;
  //   if (key === 32) {
  //     this.revealAnswer();
  //   } else if (key  === 47 || key  === 48 || key  === 49 || key  === 50 || key  === 51 || key  === 52 || key  === 53) {
  //     this.stopListening();
  //     $('#' + key).click();
  //     console.log(key);
  //     // this.stopListening();
  //   } else {
  //     console.log(key + " has no button");
  //   }
  //   return false;
  // },

  assessResponse: function(event) {
    var cardShow = this;
    var responseAttrs = {
      'quality': $(event.currentTarget).data('quality'),
      'card_id': $(event.currentTarget).data('card-id'),
      'e_factor': $(event.currentTarget).data('e-factor'),
      };

    var response = new Devour.Models.Response(responseAttrs);
    response.save({}, {
      success: function() {
        cardShow.deck.nextQuestion();
      }
    });
  },

  revealAnswer: function(event) {
    $('button.btn-reveal').prop('disabled', true);
    $('div.answer-box').append(this.answerTemplate({ card: this.model }));
  },

  destroyCard: function(event) {
    event.preventDefault();
    console.log('You deleted a card!');
    this.model.destroy();
    this.remove();
  }

});

Devour.Views.CardShow = Backbone.CompositeView.extend({

  template: JST['card/show'],

  answerTemplate: JST['card/answer'],

  className: "card-item",

  events: {
    'click button.answer-button':'assessResponse',
    'click button.btn-reveal':'revealAnswer'
  },

  initialize: function(options) {
    this.deck = options.deck;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var question = this.template({ card: this.model });
    this.$el.html(question);
    return this;
  },

  assessResponse: function(event) {
    var quality = $(event.currentTarget).data('quality');
    $.post('api/responses', { 'quality': quality }, function(data) {
      console.log('Answer evaluated!');
      var next = this.collection.getOrFetch(this.model.id + 1);
      this.deck.nextCard(next);
    });
    // console.log($(event.currentTarget).get('id'));
    // console.log(quality);

    // $.ajax({
    //   url: '/api/cards/response',
    //   data: { quality: quality },
    //   dataType: 'json',
    //   method: 'POST'
    // });
  },

  revealAnswer: function(event) {
    $('div.answer-box').append(this.answerTemplate({ card: this.model }));
    // this.activateAnswerButtons();
  },

  destroyCard: function(event) {
    event.preventDefault();
    console.log('You deleted a card!');
    this.model.destroy();
    this.remove();
  }

});

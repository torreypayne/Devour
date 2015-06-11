Devour.Views.CardShow = Backbone.CompositeView.extend({

  template: JST['card/show'],

  answerTemplate: JST['card/answer'],

  className: "card-item",

  events: {
    'click button.card-reveal':'revealAnswer'
  },

  initialize: function(options) {
    this.model = options.model;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var question = this.template({ card: this.model });
    this.$el.html(question);
    return this;
  },

  assessResponse: function(event) {
    var quality = $(event.currentTarget).data('quality');
    $.ajax({
      url: '/api/cards/',
      data: { quality: quality },
      dataType: 'json',
      method: 'POST'
    });
  },

  revealAnswer: function(event) {
    $('div.answer-box').append(this.answerTemplate({ card: this.model }));
    this.activateAnswerButtons();
  },

  destroyCard: function(event) {
    event.preventDefault();
    console.log('You deleted a card!');
    this.model.destroy();
    this.remove();
  }

});

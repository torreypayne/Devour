Devour.Views.DeckShow = Backbone.CompositeView.extend({

  template: JST['deck/show'],

  tryAgainTemplate: JST['deck/tryagain'],

  initialize: function(options) {
    this._currentIndex = 0;
    this.listenTo(this.model.cards().models, 'remove', this.removeCardSubview);
    this.listenTo(this.model, 'sync', this.resetCards);
  },

  events: {
    'click button.go-to-add-cards':'newCard'
  },

  render: function() {
    this.$el.html(this.template({ deck: this.model }));
    this.attachSubviews();
    if (!this._currentCard) {
      this.$el.html(this.tryAgainTemplate);
    }
    return this;
  },

  initialCard: function() {
    this._currentCard = this.collection.first();
    this.addCardSubview(this._currentCard);
  },

  resetCards: function() {
    this._currentIndex = 0;
    this.nextQuestion();
  },

  nextCard: function() {
    var done = false;
    var card;
    while (done === false) {
      if (this._currentIndex >= this.model.cards().length) {
        done = true;
        card = null;
      } else {
        card = this.model.cards().models[this._currentIndex];
        if (card.get('needReview')) {
          this._currentCard = card;
          done = true;
        }
      }
      this._currentIndex += 1;
    }
  },

  nextQuestion: function() {
    this.nextCard();
    if (this._currentCard) {
      this.addCardSubview(this._currentCard);
    }
  },

  addCardSubview: function(card) {
    var cardItem = new Devour.Views.CardShow({
      model: card,
      deck: this,
      collection: this.collection
    });
    this.swapCard(cardItem);
  },

  swapCard: function(view) {
    this._currentView && this.removeSubview('ul.quiz', this._currentView);
    this._currentView = view;
    this.addSubview('ul.quiz', this._currentView);
    this.render();
  },

  newCard: function() {
    event.preventDefault();
    var card = new Devour.Models.Card({ deck_id: this.model.id });
    this._currentCard = card;
    var view = new Devour.Views.CardForm({
      model: card,
      deck: this.model,
    });
    this.swapCard(view);
  },

});

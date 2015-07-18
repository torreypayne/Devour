Devour.Views.DeckShow = Backbone.CompositeView.extend({
  template: JST['deck/show'],

  tryAgainTemplate: JST['deck/tryagain'],

  initialize: function(options) {
    this._currentIndex = 0;
    this.listenTo(this.model, 'sync', this.resetCards);
    this.nextQuestion();
  },

  events: {
    'click button.go-to-add-cards':'newCard',
    'click button.go-to-data':'showData',
    'click button.edit-button':'editCard',
    'click button.edit-card':'nextCard',
  },

  render: function() {
    this.$el.html(this.template({ deck: this.model }));
    this.attachSubviews();
    if (!this._currentCard) {
      this.$el.html(this.tryAgainTemplate);
    }
    return this;
  },

  resetCards: function() {
    this._currentIndex = 0;
    if (this.model.reviewCards().length === 0) {
      this._currentCard = null;
      this.render();
      return;
    } else {
      this.nextQuestion();
    }
  },

  nextCard: function() {
    // THIS IS WHERE THE REAL LEARNING HAPPENS!!!
    var learningChunk = 5;
    if (this._currentIndex > learningChunk-1 || this._currentIndex >= this.model.reviewCards().length) {
      this._currentIndex = 0;
      this.model.fetch();
    } else {
      this._currentCard = this.model.reviewCards().models[this._currentIndex];
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
    if (this._currentView) {
      this.removeSubview('ul.quiz', this._currentView);
    }
    this._currentView = view;
    this.addSubview('ul.quiz', this._currentView);
    this.render();
  },

  newCard: function() {
    event.preventDefault();
    this._currentCard = new Devour.Models.Card({ deck_id: this.model.id });
    var view = new Devour.Views.CardForm({
      model: this._currentCard,
      deck: this.model,
    });
    this.swapCard(view);
  },

  editCard: function() {
    event.preventDefault();
    var view = new Devour.Views.CardForm({
      model: this._currentCard,
      deck: this.model,
      deckView: this,
    });
    this.swapCard(view);
  },

  showData: function() {
    event.preventDefault();
    Backbone.history.navigate('decks/' + this.model.id + '/data', { trigger: true });
  }
});

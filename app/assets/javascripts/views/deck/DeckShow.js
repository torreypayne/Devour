Devour.Views.DeckShow = Backbone.CompositeView.extend({

  template: JST['deck/show'],

  tryAgainTemplate: JST['deck/tryagain'],

  initialize: function(options) {
    this._currentIndex = 0;
    this.listenTo(this._currentCard, 'sync add change:question', this.addCardSubview);
    this.listenTo(this.model.cards(), 'remove', this.removeCardSubview);
    this.nextQuestion();
  },

  events: {
    'click button.go-to-add-cards':'newCard'
  },

  render: function() {
    this.$el.html(this.template({ deck: this.model }));
    this.attachSubviews();
    if (!this._currentCard) {
      this.$el.append(this.tryAgainTemplate);
    }
    return this;
  },

  initialCard: function() {
    this._currentCard = this.collection.first();
    this.addCardSubview(this._currentCard);
  },

  nextQuestion: function() {
    // this._currentIndex += 1;
    // this._currentCard = this.collection.models[this._currentIndex];
    this.nextCard();
    if (this._currentCard) {
      this.addCardSubview(this._currentCard);
    }
  },

  nextCard: function() {
    var review = false;
    while (review === false) {
      this._currentIndex += 1;
      if (this._currentIndex >= this.collection.models.length) {
        this._currentCard = null;
        review = true;
        return;
      }
      var card = this.collection.models[this._currentIndex];
      review = card.needsReview();
    }
    this._currentCard = card;
    // this.addCardSubview(nextCard);
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
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.addSubview('ul.quiz', view);
  },

  newCard: function() {
    var card = new Devour.Models.Card({ deck: this.model });
    var view = new Devour.Views.CardForm({ model: card });
    this.swapCard(view);
  },

});

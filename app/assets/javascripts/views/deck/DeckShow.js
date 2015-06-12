Devour.Views.DeckShow = Backbone.CompositeView.extend({

  template: JST['deck/show'],

  initialize: function(options) {
    this._currentCard = this.collection.first();
    this._currentIndex = 0;
    this.listenTo(this._currentCard, 'sync add change:question', this.addCardSubview);
    this.listenTo(this.model.cards(), 'remove', this.removeCardSubview);
    if (this._currentCard) {
      this.addCardSubview(this._currentCard);
    } else {
      this.listenTo(this.collection, 'add sync', this.initialCard);
    }
  },

  render: function() {
    this.$el.html(this.template({ deck: this.model }));
    this.attachSubviews();
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
    this.addCardSubview(this._currentCard);
  },

  nextCard: function() {
    var review = false;
    while (review === false) {
      this._currentIndex += 1;
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
  }

});

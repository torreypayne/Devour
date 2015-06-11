Devour.Views.DeckShow = Backbone.CompositeView.extend({

  template: JST['deck/show'],

  initialize: function(options) {
    this._currentCard = this.collection.first();
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
    // this.listenTo(this._currentCard, 'sync add change:question change:answer', this.render);
    // $(this._currentCard).addClass("active");
    this.attachSubviews();
    // this.renderCard(this._currentCard);
    return this;
  },

  initialCard: function() {
    this._currentCard = this.collection.first();
    // this.swapCard(view);
    this.addCardSubview(this._currentCard);
  },

  nextCard: function(nextCard) {
    this.addCardSubview(nextCard);
  },

  addCardSubview: function(card) {
    var cardItem = new Devour.Views.CardShow({
      model: card,
      deck: this,
      collection: this.collection
    });
    this.swapCard(cardItem);
    // this.addSubview('ul.quiz', cardItem);
  },

  swapCard: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.addSubview('ul.quiz', view);
    // $('ul.quiz').append(view);
  }

});

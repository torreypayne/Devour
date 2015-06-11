Devour.Views.DeckShow = Backbone.CompositeView.extend({

  template: JST['deck/show'],

  initialize: function(options) {
    this._currentCard = this.model.cards().first();
    // console.log(this._currentCard);
    this.listenTo(this.collection, 'add sync', this.addCardSubview);
    // if (this._currentCard) {
    //   this.addCardSubview(this._currentCard);
    // }
    // this.renderCard(this._currentCard);
    // this.collection.each(function(this)).bind
    // debugger;
    this.listenTo(this.model.cards(), 'add remove sync', this.render);
    this.listenTo(this.model.cards(), 'add', this.addCardSubview);
    this.listenTo(this.model.cards(), 'remove', this.removeCardSubview);
    this.model.cards().each(function(card) {
      this.addCardSubview(card);
    }.bind(this));
    this.render();

  },

  render: function() {
    this.$el.html(this.template({ deck: this.model }));
    this.listenTo(this._currentCard, 'sync add change:question change:answer', this.render);
    $(this._currentCard).addClass("active");
    this.attachSubviews();
    // this.renderCard(this._currentCard);
    return this;
  },

  addCardSubview: function(card) {
    var cardItem = new Devour.Views.CardShow({
      model: card,
      collection: this.model.cards()
    });
    this.addSubview('ul.quiz', cardItem);
  },
  //
  // renderCard: function(card) {
  //   this.addCardSubview(card);
  //   this.attachSubview('ul.quiz', card);
  //   return this;
  //
  // },
  //
  // addCard: function(event) {
  //
  // },
  //
  // removeCard: function(event) {
  //
  // },
  //
  // initialCard: function() {
  //   if (this.model.cards().length === 0) {
  //     var card = new Devour.Models.Card();
  //     return card;
  //   }
  //   return this.model.cards().first();
  // }

});

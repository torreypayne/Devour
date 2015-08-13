Devour.Views.DeckItem = Backbone.View.extend({

  template: JST["deck/deckItem"],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render);
  },

  render: function() {
    var content = this.template( { deck: this.model });
    this.$el.html(content);
    return this;
  },

});

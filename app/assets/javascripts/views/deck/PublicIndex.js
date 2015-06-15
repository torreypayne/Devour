Devour.Views.PublicIndex = Backbone.View.extend({

  initialize: function(options) {

  },

  template: JST['deck/publicIndex'],

  render: function() {
    this.$el.html(this.template({ decks: this.collection }));
    return this;
  }

});

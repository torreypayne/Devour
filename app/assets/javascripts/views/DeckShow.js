Devour.Views.DeckShow = Backbone.View.extend({

  template: JST['deck/show'],

  render: function() {
    var showViewer = this.template({ deck: this.model });
    this.$el.html(showViewer);
    return this;
  },

});

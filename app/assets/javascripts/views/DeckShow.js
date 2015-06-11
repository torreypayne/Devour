Devour.Views.DeckShow = Backbone.View.extend({

  template: JST['deck/show'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render)
  },

  render: function() {
    var showViewer = this.template({ deck: this.model });
    this.$el.html(showViewer);
    return this;
  },

});

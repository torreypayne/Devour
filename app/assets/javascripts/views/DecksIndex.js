Devour.Views.DecksIndex = Backbone.View.extend({

  template: JST["deck/index"],

  initialize: function(options) {
    this.listenTo(this.collection, 'sync add remove reset', this.render)  
  },

  render: function() {
    var indexViewer = this.template({deck: this.model });
    this.$el.html(indexViewer);
    return this;
  },

});

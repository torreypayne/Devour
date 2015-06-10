Devour.Routers.MainRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.collection = new Devour.Collections.Decks();
  },

  routes: {
    '':'index',
    'decks/new':'new',
    'decks/:id/edit':'edit',
    'decks/:id':'show'
  },

  index: function() {
    this.collection.fetch();

  },

  new: function() {

  },

  edit: function(id) {

  },

  show: function(id) {

  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  }

});

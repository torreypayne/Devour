window.Devour = {

  Routers: {},

  Views: {},

  Collections: {},

  Navbar: {},

  Models: {},

  initialize: function() {
    var decks = new Devour.Collections.Decks();
    var router = new Devour.Routers.MainRouter({
      $rootEl: $('#content'),
      collection: decks
    });
    Backbone.history.start();
  }

};

$(document).ready(function() {
  Devour.initialize();
});

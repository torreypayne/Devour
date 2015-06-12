window.Devour = {

  // Make Sweet Robbery by 'Three 6 Mafia' theme song.

  Routers: {},

  Views: {},

  Collections: {},

  Navbars: {},

  Sidebars: {},

  Models: {},

  initialize: function() {
    // var sidebar = new Devour.Sidebars.Sidebar();
    var decks = new Devour.Collections.Decks();
    var router = new Devour.Routers.MainRouter({
      $rootEl: $('#main'),
      collection: decks
    });
    Backbone.history.start();
    var navbar = new Devour.Navbars.Navbar({
      $navEl: $('div#navigator'),
      router: router,
      collection: decks
    });
  }

};

$(document).ready(function() {
  Devour.initialize();
});

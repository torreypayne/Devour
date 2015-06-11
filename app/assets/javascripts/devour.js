window.Devour = {

  // Make Sweet Robbery by 'Three 6 Mafia' theme song.

  Routers: {},

  Views: {},

  Collections: {},

  Navbars: {},

  Sidebars: {},

  Models: {},

  initialize: function() {
    var navbar = new Devour.Navbars.Navbar();
    var sidebar = new Devour.Sidebars.Sidebar();
    var decks = new Devour.Collections.Decks();
    var router = new Devour.Routers.MainRouter({
      $rootEl: $('#content'),
      navbar: navbar,
      sidebar: sidebar,
      collection: decks
    });
    Backbone.history.start();
  }

};

$(document).ready(function() {
  Devour.initialize();
});

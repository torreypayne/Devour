window.Devour = {

  Routers: {},

  Views: {},

  Collections: {},

  Navbar: {},

  Models: {},

  initialize: function() {
    var router = new Devour.Routers.Router({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }

};

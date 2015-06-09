window.DevourApp = {

  Routers: {},

  Views: {},

  Collections: {},

  Navbar: {},

  Models: {},

  initialize: function() {
    var router = new DevourApp.Routers.Router({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }

};

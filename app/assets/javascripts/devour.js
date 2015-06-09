window.DevourApp = {

  Routers: {},

  Views: {},

  Models: {},

  initialize: function() {
    var router = new DevourApp.Routers.Router({
      $rootEl: $('#content')
    });
    Backbone.history.start();
  }

};

Devour.Models.Leaderboard = Backbone.Model.extend({

  urlRoot: 'api/leaderboards',

  users: function() {

  },

  parse: function(response) {
    return response;
  },

});

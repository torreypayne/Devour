Devour.Views.LeaderboardIndex = Backbone.CompositeView.extend({

  template: JST['leaderboard/index'],

  initialize: function(options) {
    
  },

  render: function() {
    this.model.fetch({
      success: function() {
        this.$el.html(this.template({ leaderboard: this.model }));
      }.bind(this)
    });
    return this;
  },

});

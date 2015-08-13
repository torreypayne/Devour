Devour.Views.LeaderboardIndex = Backbone.CompositeView.extend({

  template: JST['leaderboard/index'],

  render: function() {
    this.model.fetch({
      success: function() {
        this.$el.html(this.template());
        var view = this;
        _(this.model.attributes.users).each(function(user) {
          var leader = new Devour.Views.Leader({ model: user });
          view.$('tbody.leaderboard').append(leader.render().$el);
        });
      }.bind(this)
    });
    return this;
  },

});

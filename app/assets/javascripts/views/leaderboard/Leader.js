Devour.Views.Leader = Backbone.View.extend({

  template: JST['leaderboard/leader'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync add', this.render);
  },

  tagName: 'tr',

  render: function() {
    console.log(this.model);
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },
})

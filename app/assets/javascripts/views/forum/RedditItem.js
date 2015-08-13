Devour.Views.RedditItem = Backbone.View.extend({

  template: JST['reddit/redditItem'],

  tagName: 'li',

  initialize: function(options) {

  },

  render: function() {
    var content = this.template({ subReddit: this.model });
    this.$el.html(content);
    return this;
  },

});

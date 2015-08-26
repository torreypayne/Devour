Devour.Views.forumItem = Backbone.View.extend({

  template: JST['forum/forumItem'],

  tagName: 'li',

  initialize: function(options) {

  },

  render: function() {
    var content = this.template({ subforum: this.model });
    this.$el.html(content);
    return this;
  },

});

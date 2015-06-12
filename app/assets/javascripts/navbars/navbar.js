Devour.Navbars.Navbar = Backbone.View.extend({

  initialize: function(options) {
    this.$navEl = options.$navEl;
    this.router = options.router;
    // this.listenTo(this.router, 'route', this.render);
    this.render();
  },

  tagName: 'nav',

  template: JST['navbar/navshow'],

  render: function() {
    this.$navEl.html(this.template());
    return this;
  }

});

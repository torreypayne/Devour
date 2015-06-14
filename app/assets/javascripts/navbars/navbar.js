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
    var currentUser = $('#current-user').data('id');
    this.$navEl.html(this.template({ currentUser: currentUser }));
    return this;
  }

});

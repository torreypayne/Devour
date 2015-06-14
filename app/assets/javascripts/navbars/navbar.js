Devour.Navbars.Navbar = Backbone.View.extend({

  initialize: function(options) {
    this.$navEl = options.$navEl;
    this.router = options.router;
    this.listenTo(this.router, 'route', this.render);
    this.render();
  },

  tagName: 'nav',

  template: JST['navbar/navshow'],

  studyDropdown: JST['navbar/study'],

  events: {
    'click button#sign-out':'signOut',
    'click button.dropdown-toggle':'study',
  },

  render: function() {
    var currentUser = $('#current-user').data('id');
    this.$navEl.html(this.template({ currentUser: currentUser }));
    return this;
  },

  signOut: function(event) {
    event.preventDefault();
    $.ajax({
      url: '/session',
      type: 'DELETE',
      success: function() {
        Backbone.history.navigate('', { trigger: true });
      }
    });
  },

  study: function() {
    var publicDecks = new Devour.Collections.PublicDecks();
    publicDecks.fetch({
      success: function() {
        $('li.study-dropdown').append(this.studyDropdown({decks: publicDecks }));
      }
    });
  }

});

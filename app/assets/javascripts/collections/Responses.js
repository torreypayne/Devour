Devour.Collections.Responses = Backbone.Collection.extend({

  url: 'api/responses',

  model: Devour.Models.Response,

  getOrFetch: function(id) {
    var response = this.get(id);
    if (response) {
      response.fetch();
    } else {
      response = new Devour.Models.Response({ id: id });
      response.fetch({
        success: function() {
          this.add(response);
        }.bind(this)
      });
    }
    return response;
  },

  comparator: function(response) {
    return response.last_passed;
  }

});

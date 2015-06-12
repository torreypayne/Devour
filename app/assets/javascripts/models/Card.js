Devour.Models.Card = Backbone.Model.extend({

  urlRoot: 'api/cards',

  needsReview: function() {
    var one_day = 60*60*24*1000;
    var now = new Date(this.attributes.current_time);
    // Broken; need to convert last_passed into milliseconds
    var then = new Date(this.attributes.last_passed);
    var lapsedTime = (now - then) / one_day;
    if (lapsedTime >= this.attributes.next_rep) {
      return true;
    } else {
      return false;
    }
  }

  // In Back-end model
  // def needs_review?
  //   return true if responses.length == 0
  //   one_day = 60*60*24
  //   lapsed_time = (Time.now - last_passed)/one_day
  //   return (lapsed_time >= next_rep)
  // end

});

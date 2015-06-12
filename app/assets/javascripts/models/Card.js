Devour.Models.Card = Backbone.Model.extend({

  urlRoot: 'api/cards',

  needsReview: function() {
    var one_day = 60*60*24;
    var lapsedTime = (this.current_time - this.last_passed) / one_day;
    if (lapsedTime >= this.next_rep) {
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

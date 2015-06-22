Devour.Views.DeckData = Backbone.View.extend({

  initialize: function(options) {
    this.model = options.model;
    this.schedule = [0,0,0,0,0,0];
    this.data = {
      labels: ["Need Review", "1", "2", "3", "4", "5+"],
      datasets: [
        {
              label: "Schedule of Cards",
              fillColor: "rgba(151,187,205,0.5)",
              strokeColor: "rgba(151,187,205,0.8)",
              highlightFill: "rgba(151,187,205,0.75)",
              highlightStroke: "rgba(151,187,205,1)",
              data: this.schedule
        },
      ]
    };
    this.listenTo(this.model, 'sync', this.setData);
  },

  template: JST['deck/chart'],

  render: function() {
    this.$el.html(this.template());
    setTimeout(this.drawChart.bind(this, $('#chart')), 0);
    return this;
  },

  drawChart: function(canvas, data) {
    var ctx = $("#chart").get(0).getContext("2d");
    this.barChart = new Chart(ctx).Bar(this.data);
  },

  setData: function() {
    console.log("setData was run!");
    if (this.model.details()) {
      _(this.model.details()).each(function(card) {
        if (card.days_out === 0) {
          this.schedule[0] += 1;
        } else if (card.days_out <= 1) {
          this.schedule[1] += 1;
        } else if (card.days_out <= 2) {
          this.schedule[2] += 1;
        } else if (card.days_out <= 3) {
          this.schedule[3] += 1;
        } else if (card.days_out <= 4) {
          this.schedule[4] += 1;
        } else {
          this.schedule[5] += 1;
        }
      }.bind(this));
    }
    this.render();
  }

});

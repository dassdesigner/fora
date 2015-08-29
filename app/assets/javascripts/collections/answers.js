Fora.Collections.Answers = Backbone.Collection.extend({
  model: Fora.Models.Answer,
  url: 'api/answers',

  initialize: function (models, options) {
    this.question = options.question;
  },

  getOrFetch: function(id) {
    var answer = this.get(id);
    var that = this;
    if (!answer) {
      answer = new Fora.Models.Question({
        id: id
      });
      answer.fetch({
        success: function() {
          that.add(answer);
        }
      });
    } else {
      answer.fetch();
    }
    return answer;
  },

  comparator: function(model) {
    return -model.get('num_upvotes');
  },
});

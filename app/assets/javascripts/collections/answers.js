Fora.Collections.Answers = Backbone.Collection.extend({
  model: Fora.Models.Answer,
  url: 'api/answers',

  initialize: function (models, options) {
    this.question = options.question;
  },

  comparator: function(model) {
    return -model.get('num_upvotes');
  },
});

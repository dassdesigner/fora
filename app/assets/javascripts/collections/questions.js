Fora.Collections.Questions = Backbone.Collection.extend({
  url: "/api/questions",
  model: Fora.Models.Question,

  comparator: function(model) {
    return -model.get('num_upvotes');
  },
  getOrFetch: function(id) {
    var question = this.get(id);
    var that = this;
    if (!question) {
      question = new Fora.Models.Question({
        id: id
      });
      question.fetch({
        success: function() {
          that.add(question);
        }
      });
    } else {
      question.fetch();
    }
    return question;
  }

});

Fora.Collections.Answers = Backbone.Collection.extend({
  model: Fora.Models.Answer,
  url: 'api/answers',

  initialize: function (models, options) {
    this.question = options.question;
  },

  getOrFetch: function (id) {
    var answer = this.get(id);
    that = this;
    if (!question) {
      answer = new Fora.Models.Answer({id: id});
      answer.fetch({success: function(){
        that.add(answer);
      }})
    } else {
      answer.fetch();
    }
    return answer;
  }
})

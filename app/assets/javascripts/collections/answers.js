Fora.Collections.Answers = Backbone.Collection.extend({
  model: Fora.Models.Answer,
  url: 'api/answers',

  initialize: function (models, options) {
    this.question = options.question;
  },

  comparator: function(model) {
    return model.get('num_upvotes');
  },
  //
  // getOrFetch: function (id) {
  //   var answer = this.get(id);
  //   that = this;
  //   if (!answer) {
  //     answer = new Fora.Models.Answer({id: id});
  //     answer.fetch({success: function(){
  //       that.add(answer);
  //     }})
  //   } else {
  //     answer.fetch();
  //   }
  //   return answer;
  // }
});

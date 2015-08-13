Fora.Models.Question = Backbone.Model.extend({
  urlRoot: "api/questions"
  answers: function () {
    if (!this._answers) {
      this._answers = new Fora.Collections.Answers([], {question: this})
    }

    return this._cards;
  },
  
  }
});

Fora.Models.Question = Backbone.Model.extend({
  urlRoot: "api/questions",
  answers: function () {
    if (!this._answers) {
      this._answers = new Fora.Collections.Answers([], {question: this});
    }

    return this._answers;
  },

  tags: function () {
    if (!this._tags) {
      this._tags = new Fora.Collections.Tags([], {question: this});
    }

    return this._tags;
  },
  
  parse: function(resp) {
    if (resp.answers) {
      this.answers().set(resp.answers);
      delete resp.answers;
    }
    return resp;
  }
});

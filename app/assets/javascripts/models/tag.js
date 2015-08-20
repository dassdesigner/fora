Fora.Models.Tag = Backbone.Model.extend({
  urlRoot: 'api/tags',

  questions: function () {
    if (!this._questions) {
      this._questions = new Fora.Collections.Questions([], {question: this});
    }
    return this._questions;
  },

  parse: function(resp) {
    if (resp.questions) {
      this.questions().set(resp.questions);
      delete resp.questions;
    }
    return resp;
  }
});

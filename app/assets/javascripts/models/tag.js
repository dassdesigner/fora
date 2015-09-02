Fora.Models.Tag = Backbone.Model.extend({
  urlRoot: 'api/tags',

  questions: function () {
    if (!this._questions) {
      this._questions = new Fora.Collections.Questions([], {question: this});
    }
    return this._questions;
  },

  parse: function(payload) {
    if (payload.questions) {
      this.questions().set(payload.questions);
      delete payload.questions;
    }
    this.parseFollow(payload);
    return payload;
  }
});

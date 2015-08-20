Fora.Models.Tag = Backbone.Model.extend({
  urlRoot: 'api/tags',

  questions: function () {
    if (!this._questions) {
      this._questions = new Fora.Collections.Questions([], {question: this});
    }
    return this.questions;
  },


});

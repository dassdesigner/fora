Fora.Models.Tag = Backbone.Model.extend({
  urlRoot: 'api/tags',

  questions: function () {
    if (!this._questions) {
      this._questions = new Fora.Collections.Questions([], {question: this});
    }
    return this.questions;
  },

  getOrFetch: function (id) {
    var tag = this.get(id);
    var that = this;

    if (!tag) {
      tag = new Fora.Models.Tag({id: id});
      tag.fetch({
        success: function(){
          that.add(tag);
        }
      });
    } else {
      tag.fetch();
    }
    return tag;
  }
});

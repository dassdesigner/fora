Fora.Views.AnswerForm = Backbone.View.extend({
  template: JST["answers/form"],
  tagName: 'form',
  className: 'answer-form-container',
  events: {
    "click button" : "submit",
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function() {
    var content = this.template({answer: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var that = this;
    this.model.set(attrs);
    this.model.save({}, {success: function () {
      that.collection.add(that.model, {merge: true});
      that.collection.getOrFetch(that.model.id);
      // Backbone.history.navigate("#questions/" + that.model.get('question_id'), {trigger: true});
      that.model = new Fora.Models.Answer({question_id: that.model.escape('question_id')});
      }
    });
  }

});

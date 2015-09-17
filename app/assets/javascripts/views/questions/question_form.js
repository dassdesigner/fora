Fora.Views.QuestionForm = Backbone.View.extend({
  template: JST["questions/form"],
  tagName: 'form',
  className: 'question-form',
  events: {
    "click button.submit" : "submit"
  },

  render: function() {
    var content = this.template({question: this.model});
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var that = this;
    this.model.set(attrs);
    debugger;
    this.model.save({}, {success: function () {
      that.collection.add(that.model, {merge: true});
      Backbone.history.navigate("#questions/" + that.model.get('id'), {trigger: true});
      }
    });
  }
});

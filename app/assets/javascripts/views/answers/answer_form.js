Fora.Views.AnswerForm = Backbone.View.extend({
  template: JST["answers/form"],
  tagName: 'form',
  events: {
    "click button" : "submit"
  },
  render: function() {
    debugger
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
      Backbone.history.navigate("", {trigger: true});
      }
    });

  }

});

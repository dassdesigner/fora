Fora.Views.QuestionShow = Backbone.CompositeView.extend({
  template: JST["questions/show"],
  events: {
    "click button.edit" : "edit",
    "click button.delete" : "delete"
  },

  initialize: function () {
    this.listenTo(this.model, "sync add destroy change", this.render);
    var answer = new Fora.Models.Answer({question_id: this.model.get('id')});
    var answersIndex = new Fora.Views.AnswersIndex({collection: this.model.answers()});
    var answerForm = new Fora.Views.AnswerForm({model: answer, collection: this.model.answers()});
    this.addSubview('.answer-form', answerForm);
    this.addSubview('.answers-index', answersIndex);
  },

  render: function () {
    var content = this.template({question: this.model});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },


  delete: function (event) {
    event.preventDefault();
    var that = this;
    this.model.destroy({success: function () {
      that.collection.remove(that.model);
      Backbone.history.navigate("", {trigger: true});
    }});
  }
});

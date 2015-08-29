  Fora.Views.AnswersIndex = Backbone.CompositeView.extend({
  template: JST["answers/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addAnswerSubview);
    this.listenTo(this.collection, "remove", this.removeAnswerSubview);
    var that = this;
    this.collection.each (function (answer) {
      that.addAnswerSubview(answer);
    });
    this.collection.fetch({data: {question_id: this.collection.question.id, top: true}});
  },

  addAnswerSubview: function (answer) {
    var subView = new Fora.Views.AnswersIndexItem({model: answer});
    this.addSubview('.answers-container', subView);
  },

  removeAnswerSubview: function (answer) {
    //TODO switch to removemodelsubview
    that = this;
    this.subviews('.answers-container').forEach(function(subview){
      if (subview.model === answer) {
        that.removeSubview('.answers-container', subview);
      }
    });
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }

});

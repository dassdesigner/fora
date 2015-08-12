Fora.Routers.Router = Backbone.Router.extend({

  initialize: function () {
    this.collection = new Fora.Collections.Questions();
    this.$rootEl = ('#main');
  }
  routes: {
    "": "feedShow"
    "questions": "questionsIndex",
    "questions/new": "questionNew",
    "questions/:id": "questionShow",
  }

  questionsIndex: function () {
    this.collection.fetch();
    var view = Fora.Views.QuestionsIndex({questions: this.collection});
    this._swapView(view);
  }

  questionNew: function () {
    var question = new Fora.Models.Question();
    var view = Fora.Views.QuestionForm({model: question});
    this._swapView(view);
  }

  questionShow: function (id) {
    var question = this.collection.getOrFetch(id);
    var view = Fora.Views.QuestionShow({
      collection: this.collection, model: question
    });
    this._swapView(view);
  }

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

})

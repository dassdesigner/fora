Fora.Routers.Router = Backbone.Router.extend({

  initialize: function () {
    this.collection = new Fora.Collections.Questions();
    this.$rootEl = $('#main');
  },
  routes: {
    "": "questionsIndex", //TODO change to feedShow
    "questions": "questionsIndex",
    "questions/new": "questionNew",
    "questions/:id": "questionShow",
  },

  questionsIndex: function () {
    this.collection.fetch();
    var view = new Fora.Views.QuestionsIndex({
        collection: this.collection});
    this._swapView(view);
  },

  questionNew: function () {
    var question = new Fora.Models.Question();
    var view = new Fora.Views.QuestionForm({
        model: question, collection: this.collection});
    this._swapView(view);
  },

  questionShow: function (id) {
    var question = this.collection.getOrFetch(id);
    var view = Fora.Views.QuestionShow({
        collection: this.collection, model: question
    });
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});

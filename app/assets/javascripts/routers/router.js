Fora.Routers.Router = Backbone.Router.extend({

  initialize: function () {
    this.tags = new Fora.Collections.Tags();
    var navbarView = new Fora.Views.Navbar();
    this.$navbar = $('.navbar');
    this.$sidebar = $('#sidebar');
    this.$rootEl = $('#main');
    this.$navbar.html(navbarView.render().$el);
    // this.collection.sort();
    //should take current user('s') topics?

  },
  routes: {
    "": "questionsIndex", //TODO change to feedShow
    "questions": "questionsIndex",
    "questions/new": "questionNew",
    "questions/:id": "questionShow",
    "tags/:id": "tagShow",
    "search?:query" : "searchShow"
  },

  questionsIndex: function () {
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch();
    var user_tags = new Fora.Collections.Tags();
    user_tags.fetch();

    var view = new Fora.Views.QuestionsIndex({
        collection: this.collection,
        });

    var sideView = new Fora.Views.SidebarFeed({collection: user_tags});

    this._swapSidebarView(sideView);
    this._swapView(view);
  },

  questionShow: function (id) {
    this.collection = new Fora.Collections.Questions();
    var question = this.collection.getOrFetch(id);
    var view = new Fora.Views.QuestionShow({
        model: question
    });

    var sideView = new Fora.Views.SidebarQuestion({
        current_question: question
    });
    this._swapSidebarView(sideView);
    this._swapView(view);
  },

  tagShow: function (id) {
    var tag = this.tags.getOrFetch(id);
    var user_tags = new Fora.Collections.Tags();
    var tag_questions = tag.questions();
    user_tags.fetch();
    var view = new Fora.Views.TagShow({
      model: tag,
      collection: tag_questions,
      user_tags: user_tags
    });

    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags
    });
    this._swapSidebarView(sideView);
    this._swapView(view);
  },

  searchShow: function (query) {
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch({data: query });
    var view = new Fora.Views.QuestionsIndex({
        collection: this.collection,
        });

    var user_tags = new Fora.Collections.Tags();
    user_tags.fetch();

    // TODO: allow for sorting
    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags
    });

    this._swapSidebarView(sideView);
    this._swapView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  _swapSidebarView: function (view) {
    this._sidebarView && this._sidebarView.remove();
    this._sidebarView = view;
    this.$sidebar.html(view.render().$el);
  }

});

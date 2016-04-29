Fora.Routers.Router = Backbone.Router.extend({

  initialize: function() {
    this.tags = new Fora.Collections.Tags();
    var navbarView = new Fora.Views.Navbar();
    this.$navbar = $('.navbar');
    this.$sidebar = $('#sidebar');
    this.$rootEl = $('#main');
    this.$rightSidebar = $('#right-sidebar');
    this.$navbar.html(navbarView.render().$el);


  },
  routes: {
    "": "questionsIndex", //TODO change to feedShow
    "questions": "questionsIndex",
    "questions/new": "questionNew",
    "questions/:id": "questionShow",
    "tags/:id": "tagShow",
    "search?:query": "searchShow",
    "answer": "unansweredQuestionsIndex"
  },

  unansweredQuestionsIndex: function () {
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch({data: {unanswered_questions: true}});
    var user_tags = new Fora.Collections.Tags();
    user_tags.fetch();
    var non_user_tags = new Fora.Collections.Tags();
    non_user_tags.fetch({data: {more_tags: true}});
    var view = new Fora.Views.QuestionsIndex({
      collection: this.collection,
      title: "Write Answers - Fora"
    });

    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags,
    });

    var rightSideView = new Fora.Views.RightSidebarFeed({
      collection: non_user_tags,
    });

    this._swapSidebarView(sideView);
    this._swapView(view);
    this._swapRightSidebarView(rightSideView);
  },

  questionsIndex: function() {
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch();
    var user_tags = new Fora.Collections.Tags();
    user_tags.fetch();
    var non_user_tags = new Fora.Collections.Tags();
    non_user_tags.fetch({data: {more_tags: true}});
    var view = new Fora.Views.QuestionsIndex({
      collection: this.collection,
      title: "Fora - Home"
    });

    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags,
    });

    var rightSideView = new Fora.Views.RightSidebarFeed({
      collection: non_user_tags,
    });

    this._swapSidebarView(sideView);
    this._swapView(view);
    this._swapRightSidebarView(rightSideView);
  },

  questionShow: function(id) {
    this.collection = new Fora.Collections.Questions();
    var question = this.collection.getOrFetch(id);
    var view = new Fora.Views.QuestionShow({
      model: question
    });

    var sideView = new Fora.Views.SidebarQuestion({
      current_question: question,
    });
    this._swapSidebarView(sideView);
    this._swapView(view);
  },

  tagShow: function(id) {
    var tag = this.tags.getOrFetch(id);
    var user_tags = new Fora.Collections.Tags();
    var tag_questions = tag.questions();
    tag_questions.fetch({data: {tag_id: id}});
    user_tags.fetch();
    var non_user_tags = new Fora.Collections.Tags();
    non_user_tags.fetch({data: {more_tags: true}});
    var view = new Fora.Views.TagShow({
      model: tag,
      collection: tag_questions,
      user_tags: user_tags
    });

    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags,
      tag_id: id,
    });

    var rightSideView = new Fora.Views.RightSidebarFeed({
      collection: non_user_tags,
    });
    this._swapSidebarView(sideView);
    this._swapView(view);
    this._swapRightSidebarView(rightSideView);
  },

  searchShow: function(query) {
    this.collection = new Fora.Collections.Questions();
    this.collection.fetch({
      data: query
    });

    var non_user_tags = new Fora.Collections.Tags();
    non_user_tags.fetch({data: {more_tags: true}});
    var view = new Fora.Views.QuestionsIndex({
      collection: this.collection,
      title: "Search - " + query.split("=")[1] + " - Fora"
    });

    var user_tags = new Fora.Collections.Tags();
    user_tags.fetch();

    var sideView = new Fora.Views.SidebarFeed({
      collection: user_tags
    });

    var rightSideView = new Fora.Views.RightSidebarFeed({
      collection: non_user_tags,
    });
    this._swapSidebarView(sideView);
    this._swapView(view);
    this._swapRightSidebarView(rightSideView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  _swapSidebarView: function(view) {
    this._sidebarView && this._sidebarView.remove();
    this._sidebarView = view;
    this.$sidebar.html(view.render().$el);
  },

  _swapRightSidebarView: function (view) {
    this._rightSidebarView && this._rightSidebarView.remove();
    this._rightSidebarView = view;
    this.$rightSidebar.html(view.render().$el);
  }



});

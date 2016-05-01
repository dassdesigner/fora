Fora.Views.QuestionsIndex = Backbone.CompositeView.extend({
  template: JST["questions/index"],
  tagName: "div",
  className: "feed",
  events: {
    "click #scroll-up" : "scrollUp"
  },

  initialize: function (params) {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addQuestionSubview);
    var that = this;
    document.title = params.title;
    this.collection.each (function (question) {
      that.addQuestionSubview(question);
    });

  },

  addQuestionSubview: function (question) {
    var subView = new Fora.Views.QuestionsIndexItem({model: question});
    this.addSubview(".content-container", subView);
  },

  scrollUp: function (e) {
    e.preventDefault();
    $("html, body").animate({ scrollTop: 0 }, "slow");
  },

  render: function () {
    var content = this.template();

    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});

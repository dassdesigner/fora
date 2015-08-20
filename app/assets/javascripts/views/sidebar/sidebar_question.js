Fora.Views.SidebarQuestion = Backbone.CompositeView.extend({
  template: JST["sidebars/question"],
  initialize: function (options) {
    var current_question = options.current_question;
    var tagsIndex = new Fora.Views.TagsIndex({
      collection: current_question.tags()
    });
    var tagForm = new Fora.Views.TagForm({
      collection: current_question.tags(),
      model: new Fora.Models.Tag()
    });
    this.addSubview('.tags-index', tagsIndex);
    this.addSubview('.tag-form', tagForm);
  },

  // addTagsSubview: function (tag) {
  //   var subView = new Fora.Views.TagsIndexItem({model: tag});
  //   this.addSubview(".tags-container", subView);
  // },
  //
  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});

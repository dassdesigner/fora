Fora.Views.SidebarQuestion = Backbone.CompositeView.extend({
  template: JST["right_sidebars/question"],
  initialize: function (options) {
    var current_question = options.current_question;
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

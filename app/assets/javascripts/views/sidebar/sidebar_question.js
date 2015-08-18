Fora.Views.SidebarQuestion = Backbone.CompositeView.extend({
  template: JST["sidebars/question"],
  initialize: function () {
    var tag = new Fora.Models.Tag();
    var tagsIndex = new Fora.Views.TagsIndex({
      collection: this.current_question.tags()
    });
    var tagForm = new Fora.Views.TagForm({
      model: tag,
      collection: this.current_question.tags()
    });


  }

});

Fora.Views.QuestionsIndex = Backbone.View.Extend({
  template: JST["topics/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
    var that = this;
    this.collection.each (function (topic) {
      that.addTopicSubview(topic);
      });
    }

});

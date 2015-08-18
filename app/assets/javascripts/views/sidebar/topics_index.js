// Fora.Views.TopicsIndex = Backbone.View.Extend({
//   template: JST["topics/index"],
//
//   initialize: function () {
//     this.listenTo(this.collection, "sync", this.render);
//     var that = this;
//     this.collection.each (function (topic) {
//       that.addTopicSubview(topic);
//     });
//   },
//
//   addTopicView: function (topic) {
//     var subView = new Fora.Views.TopicsIndexItem({model: topic});
//     this.addSubview(".topics-container", subview);
//   },
//
//   render: function () {
//     var content = this.template();
//     this.$el.html(content);
//     this.attachSubviews();
//     return this;
//   }
// });

Fora.Collections.Links = Backbone.Collection.extend({
  url: "/api/questions",
  model: Fora.Models.Link,

  // comparator: function () {
  //
  // }
  //
  getOrFetch: function (id) {
    var question = this.get(id);
    that = this;
    if (!question) {
      question = new Fora.Models.Link({id: id});
      question.fetch({success: function(){
        that.add(question);
      }})
    } else {
      question.fetch();
    }
    return question;
  }
});

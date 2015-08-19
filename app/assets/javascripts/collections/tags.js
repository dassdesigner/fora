Fora.Collections.Tags = Backbone.Collection.extend({
  // url: "/api/tags",
  url: function(){
    if(this.question){
      return this.question.url() + "/tags";
    } else {
      return "/api/tags";
    }
  },
  model: Fora.Models.Tag,

  initialize: function (models, options) {
    this.question = options.question;
  }
});

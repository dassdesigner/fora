Fora.Collections.Tags = Backbone.Collection.extend({
  url: function(){
    if(this.question){
      return this.question.url() + "/tags";
    } else {
      return "/api/tags";
    }
  },
  model: Fora.Models.Tag,

  initialize: function (models, options) {
    if (options && options.question) { this.question = options.question; }
  },


});

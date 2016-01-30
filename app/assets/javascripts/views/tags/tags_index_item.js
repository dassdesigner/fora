Fora.Views.TagsIndexItem = Backbone.View.extend({
      template: JST["tags/index_item"],
      tagName: "li",
      events: {
        "click .delete-topic": "deleteTopic",
      },

      initialize: function(options) {
        this.listenTo(this.collection, "sync add", this.render);
        this.tagType = options.tagType;
        debugger;
        if (options.questionId) {
          this.questionId = options.questionId;
        }
      },

      deleteTopic: function(event) {
        this.model.destroy(
            {
              data: {
                tag_type: this.tagType,
                question_id: this.questionId
              },
              processData: true
            });
          },
          render: function() {
            var content = this.template({
              tag: this.model
            });
            this.$el.html(content);
            return this;
          }



      });

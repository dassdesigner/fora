Fora.Models.Question = Backbone.Model.extend(
  _.extend({}, Fora.Mixins.Voteable, {
    urlRoot: "api/questions",

    voteableOptions: {
      foreignKeyType: "Question"
    },

    answers: function() {
      if (!this._answers) {
        this._answers = new Fora.Collections.Answers([], {
          question: this
        });
        return this._answers;
      }

      return this._answers;
    },

    tags: function() {
      if (!this._tags) {
        this._tags = new Fora.Collections.Tags([], {
          question: this
        });
      }
      return this._tags;
    },

    parse: function(payload) {
      if (payload.answers) {
        this.answers().set(payload.answers);
        delete payload.answers;
      }

      if (payload.tags) {
        this.tags().set(payload.tags);
        delete payload.tags;
      }

      this.parseVote(payload);
      return payload;
    }
  })
);

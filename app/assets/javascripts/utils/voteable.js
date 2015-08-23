Fora.Mixins.Voteable = {
  vote: function () {
    if (!this._vote) {
      this._vote = new Fora.Models.Vote();
    }
    return this._vote;
  },
  // TODO: refactor! using ternaries and an additional option maybe? for now it's
  // so I can have clarity :^)
  createUpvote: function () {
    this.vote().set(this.voteableOptions.foreign_key, this.id);
    this.vote().save({}, {
      success: function () {
        this.updateUpvoteCount(1);
      }.bind(this)
    });
  },

  createDownvote: function () {
    this.vote().set(this.voteableOptions.foreign_key, this.id);
    this.vote().save({}, {
      success: function () {
        this.updateDownvoteCount(1);
      }.bind(this)
    });
  },


  destroyUpvote: function () {
    this.vote().destroy({
      success: function(model) {
        model.unset("id");
        this.updateUpvoteCount(-1);
      }.bind(this)
    });
  },

  destroyDownvote: function () {
    this.vote().destroy({
      success: function(model) {
        model.unset("id");
        this.updateDownvoteCount(-1);
      }.bind(this)
    });
  },

  updateUpvoteCount: function (delta) {
    this.set("num_upvotes", this.get("num_votes") + delta);
  },

  parseVote: function (payload) {
    if (payload.vote) {
      this.vote().set(payload.vote);
      delete payload.vote;
    }
  }
};

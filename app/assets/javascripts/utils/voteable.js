// TODO: 1.) refactor! using ternaries and an additional option maybe? for now it's
// so I can have clarity :^)
// 2.) destroy the opposite type of vote if it exists
Fora.Mixins.Voteable = {
  vote: function () {
    if (!this._vote) {
      this._vote = new Fora.Models.Vote();
    }
    return this._vote;
  },
  createUpvote: function () {

    this.vote().set({
      "voteable_id": this.id,
      "voteable_type": this.voteableOptions.foreignKeyType,
      "value": 1});

    this.vote().save({}, {
      success: function () {
        this.updateUpvoteCount(1);
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

  toggleUpvote: function () {

    if (this.vote().isNew()) {
      this.createUpvote();
    } else {
      this.destroyUpvote();
    }
  },

  updateUpvoteCount: function (delta) {
    this.set("num_upvotes", this.get("num_upvotes") + delta);
  },

  parseVote: function (payload) {
    if (payload.vote) {
      this.vote().set(payload.vote);
      delete payload.vote;
    }
  }
};

Fora.Mixins.Followable = {
  follow: function () {
    if (!this._follow) {
      this._follow = new Fora.Models.Follow();
    }
    return this._follow;
  },
  createFollow: function () {

    this.follow().set({
      "followable_id": this.id,
      // "followable_type": this.followableOptions.foreignKeyType,
      "value": 1});

    this.follow().save({}, {
      success: function () {
        this.updateUpfollowCount(1);
      }.bind(this)
    });
  },

  destroyUpfollow: function () {
    this.follow().destroy({
      success: function(model) {
        model.unset("id");
        this.updateFollowCount(-1);
      }.bind(this)
    });
  },

  toggleFollow: function () {

    if (this.follow().isNew()) {
      this.createFollow();
    } else {
      this.destroyFollow();
    }
  },

  updateFollowCount: function (delta) {
    this.set("num_follows", this.get("num_follows") + delta);
  },

  parseFollow: function (payload) {
    if (payload.follow) {
      this.follow().set(payload.follow);
      delete payload.follow;
    }
  }
};

class TagFollowing < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  validates_uniqueness_of :user, scope: :tag_id
end

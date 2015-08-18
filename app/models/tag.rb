class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :tag_followings
  has_many :questions, :through => :tagging
  has_many :users, :through => :tag_following
end

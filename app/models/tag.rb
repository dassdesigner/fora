class Tag < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :taggings
  has_many :tag_followings
  has_many :questions, :through => :taggings
  has_many :users, :through => :tag_followings
end

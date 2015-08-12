class Question < ActiveRecord::Base
  validates :author_id, :title, :votes, presence: true
  belongs_to :user
end

class Question < ActiveRecord::Base
  validates :author_id, :title, :votes, presence: true
  belongs_to :user, foreign_key: :author_id
  has_many :answers, dependent: :destroy
end

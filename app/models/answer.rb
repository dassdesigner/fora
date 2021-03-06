class Answer < ActiveRecord::Base
  validates :author_id, :body, presence: true
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :votes, as: :voteable
  has_many :voters, :through => :votes, :source => :voter
  belongs_to :question


end

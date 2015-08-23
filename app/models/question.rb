class Question < ActiveRecord::Base
  validates :author_id, :title, presence: true
  belongs_to :user, foreign_key: :author_id
  has_many :answers, dependent: :destroy
  has_many :tags, :through => :taggings
  has_many :taggings
  has_many :votes, as: :voteable
  has_many :voters, :through => :votes, :source => :voter
  def self.topic_matches(query)
    query_arr = query.split(" ")
    Question.all.select {|q| q.tags.any? { |tag| query_arr.any? { |query_word| tag.title.include?(query_word)}}}
  end

  def self.title_matches(query)
    query_arr = query.split(" ")
    Question.all.select {|q| query_arr.any? { |query_word| q.title.include?(query_word)}}
  end

  def current_user_vote(current_user_id)
    votes.find_by({user_id: current_user_id})
  end
end

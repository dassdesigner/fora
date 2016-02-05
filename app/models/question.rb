class Question < ActiveRecord::Base
  validates :author_id, :title, presence: true
  belongs_to :user, foreign_key: :author_id
  has_many :answers, dependent: :destroy
  has_many :tags, :through => :taggings
  has_many :taggings
  has_many :votes, as: :voteable
  has_many :voters, :through => :votes, :source => :voter
  # validates_uniqueness_of :tags

  def self.topic_matches(query)
      query_arr = query.split(" ")
      Question.all.select {|q| q.tags.any? { |tag| query_arr.any? { |query_word| tag.title.downcase.include?(query_word.downcase)}}}
  end

  def self.title_matches(query)
    query_arr = query.split(" ")
    Question.all.select {|q| query_arr.any? { |query_word| q.title.downcase.include?(query_word.downcase)}}
  end

  def self.more_questions(question)
    more_questions = Question.all.sample(3)
    while more_questions.include?(question)
      more_questions = Question.all.sample(3)
    end

    more_questions
  end

  def self.related_questions(question)
    question.tags.map {|t| t.questions}.flatten.sample(5).select {|q| q != question}
  end
  def top_answer
    answers.max_by {|a| a.votes.length}
  end

  def related_questions
    Question.select {|q| !(q.tags & tags).empty?}
  end
end

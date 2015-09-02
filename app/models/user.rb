class User < ActiveRecord::Base
  validates :email, :name, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true

  after_initialize :ensure_session_token
  attr_reader :password
  has_many :answers
  has_many :questions
  has_many :tag_followings
  has_many :tags, :through => :tag_followings
  has_many :votes
  has_many :voted_questions, :through => :votes, :source => :voteable,
           :source_type => 'Question'
  has_many :voted_answers, :through => :votes, :source => :voteable,
           :source_type => 'Answer'


  def self.find_by_credentials(user_params)
    user = User.find_by_email(user_params[:email])
    if user && user.is_password?(user_params[:password])
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  def votes_hash(type)
    type_votes = votes.where(voteable_type: type)
    zipped_votes = type_votes.pluck(:voteable_id).zip(type_votes)
    votes_hash = {}
    zipped_votes.each do |(id, vote)|
      votes_hash[id] = vote
    end

    votes_hash
  end

  def follows_hash
    zipped_follows = tag_followings.pluck(:tag_id).zip(tag_followings)
    follows_hash = {}

    zipped_follows.each do |(id, like)|
      follows_hash[id] = like
    end

    follows_hash
  end

  protected

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end

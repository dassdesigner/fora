class User < ActiveRecord::Base
  validates :email, :name, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :email, uniqueness: true

  after_initialize :ensure_session_token
  attr_reader :password
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

  protected

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end

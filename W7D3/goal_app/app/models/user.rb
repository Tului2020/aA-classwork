class User < ApplicationRecord
  validates :username, :password_digest, :password, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum:6}

  attr_reader :password
  after_initialize :ensure_session_token

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username:username)
    (user && user.is_password?(password)) ? (user) : (nil)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  has_many :goals,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Goal


  has_many :friends,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Friend


  has_many :comments,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Comment
end

class User < ActiveRecord::Base
  validates :email, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many(
  :decks,
  class_name: 'Deck',
  foreign_key: :owner_id,
  primary_key: :id
  )

  attr_accessor :password


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(params)
    user = User.find_by_email(params[:email])
    if user && user.is_password?(params[:password])
      return user
    else
      return nil
    end
  end
end

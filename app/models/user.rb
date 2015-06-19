# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validate :password_confirmed
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  attr_accessor :score

  after_initialize :ensure_session_token

  has_many(
    :owned_decks,
    class_name: 'Deck',
    foreign_key: :owner_id,
    primary_key: :id
  )
  has_many :deck_shares
  has_many :decks, through: :deck_shares
  has_many :cards, through: :decks
  has_many :responses
  has_many(
    :sent_messages,
    class_name: 'Message',
    foreign_key: :sender_id,
    primary_key: :id
  )
  has_many(
    :received_messages,
    class_name: 'Message',
    foreign_key: :receiver_id,
    primary_key: :id
  )

  attr_accessor :password, :password_confirmation

  def password_confirmed
    if (password != password_confirmation)
      self.errors[:password] = "Passwords did not match!"
    end
  end



  def password=(password)
    @password = password
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
    self.save!
    self.session_token
  end

  def self.find_by_credentials(params)
    user = User.find_by_email(params[:email])
    if user && user.is_password?(params[:password])
      return user
    else
      return nil
    end
  end

  def review_cards
    return cards.select { |card| card.needs_review?(self.id) }
  end

  def latest_response
    return responses.order('created_at DESC').first if responses.length != 0
  end

  def data
    review_times = []
    one_day = 60 * 60 * 24*1000
    self.cards.each do |card|
      lapsed_time = (Time.now.to_f * 1000 - card.latest_response(self.id).last_passed)/one_day
      review_times.push(lapsed_time.round)
    end
    review_times
  end

end

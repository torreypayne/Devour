class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true

  belongs_to :deck
  has_many :responses

end

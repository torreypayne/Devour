class DeckShare < ActiveRecord::Base
  validates :deck_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :deck_id

  belongs_to :user
  belongs_to :deck
end

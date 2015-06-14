class Deck < ActiveRecord::Base
  validates :title, :owner_id, presence: true

  after_save :share_with_self

  belongs_to(
  :owner,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :owner_id
  )

  has_many :cards

  def review_cards(user_id)
    review_array = []
    self.cards.each do |card|
      review_array.push(card) if card.needs_review?(user_id)
    end

    return review_array
  end

  def share_with_self
    DeckShare.create!(user_id: owner.id, deck_id: self.id)
  end

  def public?
    # return self['public'] == true
    #code
  end

end

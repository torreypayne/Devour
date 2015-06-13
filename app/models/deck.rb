class Deck < ActiveRecord::Base
  validates :title, :owner_id, presence: true

  belongs_to(
  :owner,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :owner_id
  )

  has_many :cards

  def review_cards
    review_array = []
    self.cards.each do |card|
      review_array.push(card) if card.needs_review?
    end

    return review_array
  end

  def public?
    # return self['public'] == true
    #code
  end

end

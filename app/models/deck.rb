class Deck < ActiveRecord::Base
  validates :title, :owner_id, presence: true

  belongs_to(
  :owner,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :owner_id
  )

  has_many :cards

  def pending_cards
    pending = []
    cards.each do |card|
      pending.push(card) if card.needs_review?
    end

    return pending
  end

  def public?
    # return self['public'] == true
    #code
  end

end

# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  owner_id   :integer          not null
#  title      :string           not null
#  course_id  :integer
#  public     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Deck < ActiveRecord::Base
  validates :title, :owner_id, :public, presence: true

  after_save :share_with_self

  belongs_to(
  :owner,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :owner_id
  )

  has_many :deck_shares
  has_many :cards
  has_many :users, through: :deck_shares
  has_many :responses, through: :cards

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

# == Schema Information
#
# Table name: deck_shares
#
#  id         :integer          not null, primary key
#  deck_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeckShare < ActiveRecord::Base
  validates :deck_id, :user_id, presence: true
  validates_uniqueness_of :user_id, scope: :deck_id

  belongs_to :user
  belongs_to :deck
end

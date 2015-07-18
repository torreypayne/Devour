# == Schema Information
#
# Table name: user_votes
#
#  id           :integer          not null, primary key
#  value        :integer          not null
#  user_id      :integer          not null
#  votable_id   :integer          not null
#  votable_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class UserVote < ActiveRecord::Base

  validates :user, :value, presence: true
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }

  belongs_to :votable, polymorphic: true
  belongs_to :user, inverse_of: :user_votes
end

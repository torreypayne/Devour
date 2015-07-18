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

FactoryGirl.define do
  factory :user_vote do
    value 1
    user_id 1
  end
end

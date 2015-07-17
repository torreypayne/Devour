# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  deck_id    :integer          not null
#  question   :text             not null
#  answer     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :card do
    deck_id 1
    question { Faker::Lorem.word }
    answer { Faker::Lorem.paragraph }
    # association :deck, factory: :deck
    # association :responses, factory: :response
    # association :owner, factory: :user
  end
end

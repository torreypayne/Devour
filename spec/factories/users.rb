# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  password_digest        :string           not null
#  session_token          :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  password_reset_digest  :string
#  password_reset_sent_at :datetime
#

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    # association :owned_decks, factory: :deck
    # association :deck_shares, factory: :deck_share
    # association :decks, factory: :deck
    # association :cards, factory: :card
    # association :responses, factory: :response
  end
end

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    # association :owned_decks, factory: :deck
    # association :deck_shares, factory: :deck_share
    # association :decks, factory: :deck
    # association :cards, factory: :card
    # association :responses, factory: :response
  end
end

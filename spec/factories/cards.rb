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

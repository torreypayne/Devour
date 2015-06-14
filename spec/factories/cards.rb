FactoryGirl.define do
  factory :card do
    deck_id 1
    question { Faker::Lorem.word }
    answer { Faker::Lorem.paragraph }
  end
end

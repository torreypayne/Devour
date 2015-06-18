FactoryGirl.define do
  factory :message do
    sender_id 1
    receiver_id 1
    body Faker::Lorem.paragraph
  end
end

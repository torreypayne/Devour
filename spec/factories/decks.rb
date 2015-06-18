FactoryGirl.define do
  factory :deck do
    title { Faker::Name.title }
    owner_id 1
    public true
    association :owner, factory: :user
    # association :cards, factory: :card
    # association :deck_shares, factory: :deck_share
    # association :users, factory: :user
    # association :responses, factory: :response

    factory :private_deck do
      public false
    end
  end
end

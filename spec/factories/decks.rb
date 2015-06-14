FactoryGirl.define do
  factory :deck do
    title { Faker::Name.title }
    owner_id 1
    public true

    factory :private_deck do
      public false
    end
  end
end

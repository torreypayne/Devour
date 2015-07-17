# == Schema Information
#
# Table name: decks
#
#  id          :integer          not null, primary key
#  owner_id    :integer          not null
#  title       :string           not null
#  course_id   :integer
#  public      :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :text
#

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

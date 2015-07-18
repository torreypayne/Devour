# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :post do
    title { Faker::Name.title }
    url { Faker::Internet.url }
    content { Faker::Hacker.say_something_smart }
    user_id 1
  end
end

# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  body              :text             not null
#  post_id           :integer          not null
#  user_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.paragraph }
    post_id 1
    user_id 1
  end
end

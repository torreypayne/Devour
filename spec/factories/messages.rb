# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  sender_id   :integer          not null
#  receiver_id :integer          not null
#  subject     :string
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :message do
    sender_id 1
    receiver_id 1
    body Faker::Lorem.paragraph
  end
end

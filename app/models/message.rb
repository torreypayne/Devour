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

class Message < ActiveRecord::Base
  belongs_to(
  :sender,
  class_name: 'User',
  foreign_key: :sender_id,
  primary_key: :id
  )

  belongs_to(
  :receiver,
  class_name: 'User',
  foreign_key: :receiver_id,
  primary_key: :id
  )


end

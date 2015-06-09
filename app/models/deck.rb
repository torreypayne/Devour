class Deck < ActiveRecord::Base
  validates :title, :owner_id, presence: true

  belongs_to(
  :owner,
  class_name: 'User',
  primary_key: :id,
  foreign_key: :owner_id
  )

end

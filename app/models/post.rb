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

class Post < ActiveRecord::Base
  include Votable

  validates :title, :author, presence: true

  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :comments, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub
  has_many :user_votes, as: :votable

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end

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

class Comment < ActiveRecord::Base
  include Votable

  validates :body, :author, :post, presence: true
  has_many :userVotes, as: :votable

  belongs_to :post, inverse_of: :comments
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :child_comments,
    class_name: 'Comment',
    foreign_key: :parent_comment_id,
    primary_key: :comments
  )

  belongs_to(
    :parent_comment,
    class_name: 'Comment',
    foreign_key: :parent_comment_id,
    primary_key: :id
  )

end

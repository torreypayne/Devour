class Comment < ActiveRecord::Base
  include Votable

  validates :body, :author, :post, presence: true

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

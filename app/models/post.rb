class Post < ActiveRecord::Base

  validates :title, :author, presence: true

  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :comments, inverse_of: :post

  has_many :subs, through: :post_subs, source: :sub
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  # after_save :share_post

  # def share_post(sub_id)
  #   PostSub.create!(sub_id: sub_id, post_id: self.id)
  # end
  # Don't forget to include Votable, use polymorphic association
  # has_many :user_votes, as: :votable, class_name: "UserVote"

  # Without a concern, we have to write a #votes method for each votable class.
  # def votes
  #   self.user_votes.sum(:value)
  # end

end

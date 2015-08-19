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

  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  def comment_by_parent
    # Cloned from RedditOnRails, a/A
    comment_by_parent = Hash.new { |hash, key| hash[key] = [] }

    self.comments.includes(:author).each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment
    end

    comments_by_parent
  end
end

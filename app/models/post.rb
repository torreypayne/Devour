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

  def comments_by_parent
    # Cloned from forumOnRails, a/A
    comments_by_parent = Hash.new { |hash, key| hash[key] = [] }
    self.comments.includes(:author).each do |comment|
      comments_by_parent[comment.parent_comment_id] << comment.as_json(methods: :author_name)
    end
    # debugger
    # comments_by_parent[nil].sort! do |a,b|
    #   time1 = Time.new(a['created_at'].to_s)
    #   time2 = Time.new(b['created_at'].to_s)
    #   time1 <=> time2
    #  end
    comments_by_parent
  end
end

# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  deck_id    :integer          not null
#  question   :text             not null
#  answer     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true

  belongs_to :deck
  has_many :responses
  has_one :owner, through: :deck

  def latest_response(user_id)
    if responses
      user_responses = responses.where("user_id = ?", user_id)
      return user_responses.order('created_at DESC').first if user_responses && user_responses.length != 0
    end

    response = Response.new
    response.card_id = self.id
    response.user_id = user_id
    return response
  end

  def needs_review?(user_id)
    return true if responses.where("user_id = ?", user_id).length == 0
    one_day = 60*60*24*1000
    lapsed_time = (Time.now.to_f*1000 - latest_response(user_id).last_passed)/one_day
    return (lapsed_time >= latest_response(user_id).next_rep)
  end

  def new_stuff
    
  end

end

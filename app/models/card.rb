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

  # Intentionally labelled differently from Response attrs; for JSON details output only
  attr_accessor :curr_e_factor, :curr_repetitions, :passed_at, :next_interval, :days_out

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
    # must only be run with eagerly loaded last_passed and next_rep
    return true unless last_passed
    one_day = 60 * 60 * 24*1000
    lapsed_time = (Time.now.to_f * 1000 - last_passed)/one_day
    return (lapsed_time >= next_rep)
  end
end

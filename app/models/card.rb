class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true


  belongs_to :deck
  has_many :responses

  def latest_response(user_id)
    return responses.where(["user_id = ?", user_id]).order('created_at DESC').first if responses.length != 0
    Response.new
  end

  def needs_review?(user_id)
    return true if responses.length == 0
    one_day = 60*60*24*1000
    lapsed_time = (Time.now.to_f - latest_response(user_id).last_passed)/one_day
    return (lapsed_time >= latest_response(user_id).next_rep)
  end

end

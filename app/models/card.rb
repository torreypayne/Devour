class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true


  belongs_to :deck
  has_many :responses

  def latest_response
    return responses.order('created_at DESC').first if responses.length != 0
    Response.new
  end

  def needs_review?
    return true if responses.length == 0
    one_day = 60*60*24
    lapsed_time = (Time.now - latest_response.last_passed)/one_day
    return (lapsed_time >= latest_response.next_rep)
  end

end

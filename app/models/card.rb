class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true


  belongs_to :deck
  has_many :responses

  def latest_response
    return responses.order('created_at DESC').first if responses.length != 0
    response = Response.new()
    response.e_factor = 2.5
    response.repetitions = 0
    response.last_passed = (Time.now - 1000.days.ago).to_f * 1000
    return response
    #code
  end

  def needs_review?
    return true if responses.length == 0
    one_day = 60*60*24
    lapsed_time = (Time.now - latest_response.last_passed)/one_day
    return (lapsed_time >= latest_response.next_rep)
  end

end

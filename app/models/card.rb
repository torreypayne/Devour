class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true


  belongs_to :deck
  has_many :responses

  def latest_response
    return responses.order('created_at DESC').first if responses.length != 0
    response = Response.new()
    response.e_factor = 2.5
    return response
    #code
  end

end

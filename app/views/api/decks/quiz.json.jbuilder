json.extract! @deck, :title, :id, :owner_id, :public
json.review_cards @deck.review_cards do |card|
  json.extract! card, :id, :deck_id, :question, :answer, :responses
  json.e_factor card.latest_response.e_factor
  json.repetitions card.latest_response.repetitions
  json.last_passed (card.latest_response.last_passed)
  json.next_rep card.latest_response.next_rep
  json.current_time (Time.now.to_f * 1000)
  # card.responses card.responses do |response|
  #   json.extract! response, :id, :card_id, :quality, :e_factor, :next_rep, :repetitions, :last_passed
  # end
end

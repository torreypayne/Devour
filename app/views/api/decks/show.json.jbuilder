json.extract! @deck, :title, :id, :owner_id, :public
json.cards @deck.cards do |card|
  json.extract! card, :id, :deck_id, :question, :answer, :responses
  json.e_factor card.latest_response(current_user.id).e_factor
  json.repetitions card.latest_response(current_user.id).repetitions
  json.last_passed (card.latest_response(current_user.id).last_passed)
  json.next_rep card.latest_response(current_user.id).next_rep
  json.current_time (Time.now.to_f * 1000)
  json.needReview card.needs_review?(current_user.id)
  # card.responses card.responses do |response|
  #   json.extract! response, :id, :card_id, :quality, :e_factor, :next_rep, :repetitions, :last_passed
  # end
end
json.review_cards(@deck.review_cards(current_user.id)) do |review_card|
  json.extract! review_card, :id, :deck_id, :question, :answer, :responses
  json.e_factor review_card.latest_response(current_user.id).e_factor
  json.repetitions review_card.latest_response(current_user.id).repetitions
  json.last_passed (review_card.latest_response(current_user.id).last_passed)
  json.next_rep review_card.latest_response(current_user.id).next_rep
  json.current_time (Time.now.to_f * 1000)
end

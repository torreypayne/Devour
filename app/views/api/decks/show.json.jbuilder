json.extract! @deck, :title, :id, :owner_id, :public
json.review_cards(@review_cards) do |review_card|
  json.extract! review_card, :id, :deck_id, :question, :answer
  json.e_factor review_card.latest_response(current_user.id).e_factor
  json.repetitions review_card.latest_response(current_user.id).repetitions
  json.last_passed (review_card.latest_response(current_user.id).last_passed)
  json.next_rep review_card.latest_response(current_user.id).next_rep
  json.current_time (Time.now.to_f * 1000)
end

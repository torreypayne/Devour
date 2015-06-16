json.extract! @deck, :title, :id, :owner_id, :public
json.review_cards(@review_cards) do |review_card|
  json.extract! review_card, :id, :deck_id, :question, :answer
  json.e_factor review_card.e_factor
  json.repetitions review_card.repetitions
  json.last_passed (review_card.last_passed)
  json.next_rep review_card.next_rep
  json.current_time (Time.now.to_f * 1000)
end

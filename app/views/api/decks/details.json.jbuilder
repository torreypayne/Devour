json.extract! @deck, :title, :id
json.array!(@deck.cards) do |card|
  json.extract! card, :id, :deck_id, :question, :answer
  json.e_factor card.curr_e_factor
  json.repetitions card.curr_repetitions
  json.last_passed (card.passed_at)
  json.next_rep card.next_interval
  json.current_time (Time.now.to_f * 1000)
  json.days_out card.days_out
end

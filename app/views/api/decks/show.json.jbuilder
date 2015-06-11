json.extract! @deck, :title, :id, :owner_id, :public
json.cards @deck.cards, :id, :deck_id, :question, :answer, :next_rep, :e_factor, :repetitions, :last_passed

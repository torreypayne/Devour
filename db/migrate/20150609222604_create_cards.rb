class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id, null: false
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :next_rep, null: false
      t.integer :e_factor, null: false

      t.timestamps null: false
    end

    add_index :cards, :deck_id
    add_index :cards, :question
    add_index :cards, :answer
  end
end

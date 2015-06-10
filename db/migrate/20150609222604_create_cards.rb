class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :deck_id, null: false
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :next_rep, null: false, :default => 1
      t.float :e_factor, null: false, :default => 2.5
      t.integer :repetitions, null: false, :default => 0
      t.datetime :last_passed, null: false, :default => (Time.now - 1.days)

      t.timestamps null: false
    end

    add_index :cards, :deck_id
    add_index :cards, :question
    add_index :cards, :answer
  end
end

class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :card_id, null: false
      t.integer :quality, null: false
      t.float :e_factor, null: false, default: 2.3
      t.integer :next_rep, null: false
      t.integer :repetitions, null: false, default: 0
      t.float :last_passed, null: false

      t.timestamps null: false
    end

    add_index :responses, :card_id
    add_index :responses, :user_id
  end
end

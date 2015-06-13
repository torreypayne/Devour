class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :card_id, null: false
      t.integer :quality, null: false
      t.float :e_factor, null: false, default: 2.5
      t.integer :next_rep, null: false
      t.integer :repetitions, null: false, default: 0
      t.datetime :last_passed, null: false, :default => (Time.now - 1.days).to_f * 1000

      t.timestamps null: false
    end

    add_index :responses, :card_id
  end
end

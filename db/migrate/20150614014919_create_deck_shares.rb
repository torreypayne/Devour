class CreateDeckShares < ActiveRecord::Migration
  def change
    create_table :deck_shares do |t|
      t.integer :deck_id, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end

    add_index :deck_shares, [:deck_id, :user_id], unique: true
  end
end

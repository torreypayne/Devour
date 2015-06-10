class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.integer :course_id
      t.boolean :public, null: false, default: true

      t.timestamps null: false
    end

    add_index :decks, :owner_id
    add_index :decks, :title
  end
end

class AddImagesToSubs < ActiveRecord::Migration
  def change
    add_column :subs, :image_url, :string
    add_index :subs, :image_url
  end
end

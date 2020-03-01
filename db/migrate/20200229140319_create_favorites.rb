class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :content_id

      t.timestamps
    end
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :contents
  end
end

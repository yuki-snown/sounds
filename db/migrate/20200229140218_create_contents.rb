class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.integer :user_id
      t.string :title
      t.binary :image
      t.binary :sound

      t.timestamps
    end
    add_foreign_key :contents, :users
  end
end

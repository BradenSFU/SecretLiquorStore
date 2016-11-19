class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.boolean :islike
      t.integer :drink_id
      t.integer :user_id

      t.timestamps
    end
  end
end

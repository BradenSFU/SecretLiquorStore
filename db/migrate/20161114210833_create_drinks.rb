class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :Dname
      t.integer :user_id
      t.intger :drink_id

      t.timestamps
    end
  end
end

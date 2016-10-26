class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :Username
      t.string :Password
      t.string :Email
      t.text :Biography
      t.boolean :Isadmin

      t.timestamps
    end
  end
end

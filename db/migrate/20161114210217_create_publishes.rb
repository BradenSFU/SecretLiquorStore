class CreatePublishes < ActiveRecord::Migration[5.0]
  def change
    create_table :publishes do |t|
      t.string :Rname
      t.integer :user_id
      t.integer :drink_id

      t.timestamps
    end
  end
end
